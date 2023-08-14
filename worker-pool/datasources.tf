data "spacelift_current_space" "this" {}

data "aws_security_groups" "dev_sg" {
  filter {
    name   = "group-name"
    values = ["dev_sg"]
  }
}

data "aws_subnets" "dev_public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["dev_public_subnet"]
  }
}

output "dev_sg" {
  value = data.aws_security_groups.dev_sg
}

output "subnet" {
  value = data.aws_subnets.dev_public_subnets
}