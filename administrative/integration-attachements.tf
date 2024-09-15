resource "spacelift_aws_integration_attachment" "this" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = data.spacelift_stack.ec2-deployment.id
  read           = true
  write          = true
}

resource "spacelift_aws_integration_attachment" "this" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = data.spacelift_stack.demo-worker-pool.id
  read           = true
  write          = true
}