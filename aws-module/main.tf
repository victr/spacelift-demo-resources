terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "ec2-environment" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = var.instance_name
  # Required inputs 
  instance_type = var.instance_type
  ami           = data.aws_ami.dev_server_ami.id
}