resource "aws_codepipeline" "static_web_pipeline" {
  name     = "terra-robertdippolito-blog-pipeline"
  role_arn = aws_iam_role.pipeline_role.arn
  depends_on = [aws_cloudfront_distribution.cf]

  tags = {
    Environment = var.env
  }

  artifact_store {
    location = aws_s3_bucket.artifacts_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"

      configuration = {
        "Branch"               = var.repository_branch
        "Owner"                = var.repository_owner
        "PollForSourceChanges" = "false"
        "Repo"                 = var.repository_name
        OAuthToken             = var.github_token
      }
      name             = "Source"
      input_artifacts  = []
      output_artifacts = ["SourceArtifact"]
      owner            = "ThirdParty"
      provider         = "GitHub"
      run_order        = 1
      version          = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "environment"
              type  = "PLAINTEXT"
              value = var.env
            },
          ]
        )
        "ProjectName" = "static-web-build"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }
}