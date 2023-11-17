resource "spacelift_aws_integration" "this" {
  name     = "jubran-dev-account"
  role_arn = data.aws_iam_role.this.arn
  space_id = spacelift_space.demo_resources.id
}

resource "spacelift_aws_integration_attachment" "this" {
  integration_id = spacelift_aws_integration.this.id
  stack_id       = spacelift_stack.EC2-deployment.id
}