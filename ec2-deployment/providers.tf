terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"
# }

provider "aws" {
  alias = "second-account"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::379163426062:role/jubran-test-role"
    session_name = var.spacelift.run_id
  }
}