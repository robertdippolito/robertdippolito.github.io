data "archive_file" "zip_file_for_lambda" {
  type        = "zip"
  output_path = "${var.local_file_dir}/${var.name}.zip"

  dynamic "source" {
    for_each = distinct(flatten([
      for blob in var.file_globs :
      fileset(var.lambda_code_source_dir, blob)
    ]))
    content {
      content = try(
        file("${var.lambda_code_source_dir}/${source.value}"),
        filebase64("${var.lambda_code_source_dir}/${source.value}"),
      )
      filename = source.value
    }
  }
}

resource "aws_lambda_function" "lambda" {
  provider      = aws.us_east_1
  function_name = var.name
  description   = var.description

  # Find the file from S3
  s3_bucket         = var.s3_artifact_bucket
  s3_key            = aws_s3_bucket_object.artifact.id
  s3_object_version = aws_s3_bucket_object.artifact.version_id
  source_code_hash  = filebase64sha256(data.archive_file.zip_file_for_lambda.output_path)

  publish = true
  handler = var.handler
  runtime = var.runtime
  role    = aws_iam_role.lambda_at_edge.arn
  tags    = var.tags

  lifecycle {
    ignore_changes = [
      last_modified,
    ]
  }
  depends_on = [aws_s3_bucket.edge_lambda_artifacts_bucket]

}

data "aws_iam_policy_document" "assume_role_policy_doc" {
  statement {
    sid    = "AllowAwsToAssumeRole"
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "edgelambda.amazonaws.com",
        "lambda.amazonaws.com",
      ]
    }
  }
}

/**
 * Make a role that AWS services can assume that gives them access to invoke our function.
 * This policy also has permissions to write logs to CloudWatch.
 */
resource "aws_iam_role" "lambda_at_edge" {
  name               = "${var.name}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_doc.json
  tags               = var.tags
}

/**
 * Allow lambda to write logs.
 */
data "aws_iam_policy_document" "lambda_logs_policy_doc" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",

      # Lambda@Edge logs are logged into Log Groups in the region of the edge location
      # that executes the code. Because of this, we need to allow the lambda role to create
      # Log Groups in other regions
      "logs:CreateLogGroup",
    ]
  }
}

/**
 * Attach the policy giving log write access to the IAM Role
 */
resource "aws_iam_role_policy" "logs_role_policy" {
  name   = "${var.name}at-edge"
  role   = aws_iam_role.lambda_at_edge.id
  policy = data.aws_iam_policy_document.lambda_logs_policy_doc.json
}

/**
 * Creates a Cloudwatch log group for this function to log to.
 * With lambda@edge, only test runs will log to this group. All
 * logs in production will be logged to a log group in the region
 * of the CloudFront edge location handling the request.
 */
resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/${var.name}"
  tags = var.tags
}