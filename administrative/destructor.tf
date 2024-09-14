resource "spacelift_stack_destructor" "EC2-deployment" {
  stack_id = module.spacelift_stack.EC2-deployment.id
}

resource "spacelift_stack_destructor" "demo-worker-pool" {
  stack_id = module.spacelift_stack.demo-worker-pool.id
}