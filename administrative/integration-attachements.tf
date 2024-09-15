resource "spacelift_aws_integration_attachment" "ec2-deployment" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = "ec2-deployment"
  read           = true
  write          = true
  depends_on     = [module.EC2-deployment]
}

resource "spacelift_aws_integration_attachment" "demo-worker-pool" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = "demo-worker-pool"
  read           = true
  write          = true
  depends_on     = [module.demo-worker-pool]
}