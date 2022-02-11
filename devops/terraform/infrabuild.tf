data "template_file" "infra_buildspec" {
  template = file("../codebuild/infra/buildspec.yaml")
  vars = {
    TF_SRC_DIR = "devops/terraform/"
    TF_VERSION = "1.1.5"
    TF_ACTION  = "apply"
  }
}

resource "aws_codebuild_project" "infra_build" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "infra-build"
  queued_timeout = 480
  service_role   = aws_iam_role.static_build_role.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    encryption_disabled    = false
    name                   = "infra-build-${var.env}"
    override_artifact_name = false
    packaging              = "NONE"
    type                   = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    buildspec           = data.template_file.infra_buildspec.rendered
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    type                = "CODEPIPELINE"
  }
}