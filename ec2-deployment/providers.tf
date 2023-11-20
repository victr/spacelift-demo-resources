terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "prod"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::262653892496:role/jubran-cross-account"
    session_name = var.spacelift.run_id
  }
}

variable "spacelift.run_id" {}