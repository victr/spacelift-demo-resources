terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = "5.66.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
variable "spacelift_run_id" {}