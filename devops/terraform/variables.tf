variable "env" {
  description = "Environment definition"
  default     = "prod"
}

variable "region" {
  description = "AWS region"
  default     = "ca-central-1"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "deploy"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "robertdippolito"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "robertdippolito.github.io"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifact-files-terraform"
}

variable "github_token" {
  default = "sometoken"
}

variable "static_web_bucket_name" {
  description = "S3 bucket name that stores built Gatsby files"
  type        = string
  default     = "rd-personal-blog"
}

variable "tags" {
  type        = map(any)
  description = "AWS resource tags"
  default     = { "Created by" : "Terraform" }
}

variable "endpoint" {
  description = "Endpoint URL"
  type        = string
  default     = "robertdippolito.me"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "robertdippolito.me"
}

variable "allowed_methods" {
  type        = list(any)
  description = "Cloudfront default cache behavior allowed methods"
  default     = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
}

variable "cached_methods" {
  type        = list(any)
  description = "Cloudfront default cache behavior cached methods"
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "lambda_code_source_dir" {
  default = "../edgeLambda/"
}

variable "name" {
  default = "lambda-redirect-v2"
}

variable "s3_artifact_bucket" {
  default = "edge-lambda-artifacts-bucket"
}

variable "runtime" {
  default = "nodejs14.x"
}

variable "local_file_dir" {
  default = "."
}

variable "file_globs" {
  default = ["index.js", "node_modules/**", "yarn.lock", "package.json"]
}

variable "description" {
  default = "Edge Lambda responsible for adjusting uri path"
}

variable "handler" {
  default = "index.handler"
}