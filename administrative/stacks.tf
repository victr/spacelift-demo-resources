
module "EC2-deployment" {
  space_id = spacelift_space.demo-resources.id
  source       = "../modules/stack"
  name         = "EC2-deployment"
  project_root = "aws-module"
  description  = "this stack will deploy a basic ec2 instance"
}

output "stack_id" {
  value = "${module.EC2-deploymen.spacelift_stack.this.id}"
}

module "demo-worker-pool" {
  space_id = spacelift_space.demo-resources.id
  source       = "../modules/stack"
  name         = "demo-worker-pool"
  project_root = "worker-pool"
  description  = "This stack will be in charge of creating our worker pool"
}
