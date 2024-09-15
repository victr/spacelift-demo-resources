terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = "5.66.0"
    }
    random = {
      source  = "opentofu/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  region = var.aws-region
}