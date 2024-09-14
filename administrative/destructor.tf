///// WIP \\\\\
resource "spacelift_stack_destructor" "EC2-deployment" {
  stack_id = data.spacelift_stack.ec2-deployment.id
}

resource "spacelift_stack_destructor" "demo-worker-pool" {
  stack_id = data.spacelift_stack.demo-worker-pool.id
}