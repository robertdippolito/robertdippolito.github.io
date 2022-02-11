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