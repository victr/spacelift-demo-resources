# resource "spacelift_stack_destructor" "EC2-deployment" {
#   stack_id = module.EC2-deployment.spacelift_stack.this.id
# }

# resource "spacelift_stack_destructor" "demo-worker-pool" {
#   stack_id = module.demo-worker-pool.spacelift_stack.this.id
# }