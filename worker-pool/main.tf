resource "spacelift_context" "worker-pool-config" {
  description = "Necessary variables"
  name        = "worker-pool-config"
  space_id    = data.spacelift_current_space.this.id
}


resource "spacelift_worker_pool" "demo-ASG" {
  name        = "Demo-ASG"
  csr         = filebase64("./spacelift.csr")
  description = "Used for all type jobs"
  space_id    = data.spacelift_current_space.this.id
}


resource "spacelift_environment_variable" "worker_pool_config" {
  context_id = spacelift_context.worker-pool-config.id
  name       = "worker_pool_config"
  value      = file("./worker-pool.config")
}

resource "spacelift_environment_variable" "worker_pool_private_key" {
  context_id = spacelift_context.worker-pool-config.id
  name       = "worker_pool_private_key"
  value      = file("./private.key")
}

resource "spacelift_environment_variable" "worker_pool_security_groups" {
  context_id = spacelift_context.worker-pool-config.id
  name       = "worker_pool_security_groups"
  value      = tolist([data.aws_security_groups.dev_sg.ids])
}

resource "spacelift_environment_variable" "worker_pool_subnets" {
  context_id = spacelift_context.worker-pool-config.id
  name       = "worker_pool_subnets"
  value      = tolist([data.aws_subnets.dev_public_subnets])
}




# module "my_workerpool" {
#   source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v1.3.0"

#   configuration = <<-EOT
#     export SPACELIFT_TOKEN="${var.worker_pool_config}"
#     export SPACELIFT_POOL_PRIVATE_KEY="${var.worker_pool_private_key}"
#   EOT

#   min_size        = 1
#   max_size        = 1
#   worker_pool_id  = worker_pool.demo-ASG.id
#   security_groups = var.worker_pool_security_groups
#   vpc_subnets     = var.worker_pool_subnets
# }