resource "aws_iam_role" "pipeline_role" {

  assume_role_policy    = templatefile("../access/pipeline_assume_role.json", {})
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "blog-pipeline-role-${var.env}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "web_pipeline_policy" {
  description = "Policy used in trust relationship with CodePipeline"
  name        = "blog-web-pipeline-policy-${var.env}"
  path        = "/service-role/"
  policy      = templatefile("../access/web_pipeline_policy.json", {})
}

resource "aws_iam_role_policy_attachment" "pipeline_policy_attachment" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.web_pipeline_policy.arn
}

resource "aws_iam_role" "static_build_role" {
  assume_role_policy    = templatefile("../access/codebuild_assume_role.json", {})
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "build-role-${var.env}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "build_policy" {
  description = "Policy used in trust relationship with CodeBuild (${var.env})"
  name        = "build-policy-${var.env}"
  path        = "/service-role/"
  policy      = templatefile("../access/codebuild_static_build_role.json", {})
}


resource "aws_iam_role_policy_attachment" "build_policy_attachment" {
  role       = aws_iam_role.static_build_role.name
  policy_arn = aws_iam_policy.build_policy.arn
}