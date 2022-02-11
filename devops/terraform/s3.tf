
// Static Blog Files Bucket
resource "aws_s3_bucket" "blog_site_files" {
  bucket        = "${var.env}-${var.static_web_bucket_name}"
  acl           = "private"
  force_destroy = true
  tags          = var.tags
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
  bucket                  = aws_s3_bucket.blog_site_files.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "template_file" "static_s3_policy" {
  template = file("../access/blog_bucket_policy.json")
  vars = {
    bucket_name = "${var.env}-${var.static_web_bucket_name}"
    oai_id      = "${aws_cloudfront_origin_access_identity.oai.id}"

  }
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = "${var.env}-${var.static_web_bucket_name}"
  policy = data.template_file.static_s3_policy.rendered
}

// Artifact Bucket
resource "aws_s3_bucket" "artifacts_bucket" {
  bucket        = "${var.env}-${var.artifacts_bucket_name}"
  force_destroy = true
}

// Edge Lambda Artifact Bucket
resource "aws_s3_bucket_object" "artifact" {
    provider = aws.us_east_1
  bucket = var.s3_artifact_bucket
  key    = "${var.name}.zip"
  source = data.archive_file.zip_file_for_lambda.output_path
  etag   = data.archive_file.zip_file_for_lambda.output_md5
  tags   = var.tags
  depends_on = [aws_s3_bucket.edge_lambda_artifacts_bucket]
}

resource "aws_s3_bucket" "edge_lambda_artifacts_bucket" {
  provider = aws.us_east_1
  bucket        = var.s3_artifact_bucket
  force_destroy = true
  versioning {
    enabled = true
  }
}