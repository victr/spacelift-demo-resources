data "spacelift_current_space" "this" {}

data "aws_subnets" "this" {
  tags = {
    Name = "dev_public_subnet"
  }
}

data "aws_security_groups" "this" {
  tags = {
    Name = "dev_sg"
  }
}