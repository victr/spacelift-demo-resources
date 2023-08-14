data "spacelift_current_space" "this" {}

data "aws_security_groups" "dev_sg" {
  filter {
    name   = "group-name"
    values = ["dev_sg"]
  }
}