provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "github" {
  token = var.github_token
  owner = var.repository_owner
}

provider "random" {
}

provider "template" {
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "terraform-blog-state-rob-blog"
    dynamodb_table = "terraform-state-lock-dynamo"
      key = "path/path/terraform.tfstate"
      region = "ca-central-1"
  }
}