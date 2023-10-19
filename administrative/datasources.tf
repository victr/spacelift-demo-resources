data "spacelift_current_space" "this" {}

data "spacelift_aws_integration" "this" {
  name = "aws-dev"
}

data "spacelift_aws_integrations" "this" {}