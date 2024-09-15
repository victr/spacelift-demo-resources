resource "spacelift_aws_integration_attachment" "ec2-deployment" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = data.spacelift_stack.ec2-deployment.id
  read           = true
  write          = true
}

resource "spacelift_aws_integration_attachment" "demo-worker-pool" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = data.spacelift_stack.demo-worker-pool.id
  read           = true
  write          = true
}