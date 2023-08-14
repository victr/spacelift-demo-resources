resource "spacelift_worker_pool" "demo-ASG" {
  name        = "Demo-ASG"
  csr         = filebase64("./spacelift.csr")
  description = "Used for all type jobs"
  space_id    = data.spacelift_current_space.this.id
}


resource "spacelift_environment_variable" "worker_pool_config" {
  stack_id = "demo-worker-pool"
  name     = "TF_VAR_worker_pool_config"
  value    = file("./worker-pool.config")
}

resource "spacelift_environment_variable" "worker_pool_private_key" {
  stack_id = "demo-worker-pool"
  name     = "TF_VAR_worker_pool_private_key"
  value    = file("./private.key")
}

resource "spacelift_environment_variable" "worker_pool_security_groups" {
  stack_id = "demo-worker-pool"
  name     = "TF_VAR_worker_pool_security_groups"
  value    = jsonencode([data.aws_security_groups.dev_sg.ids])
}

resource "spacelift_environment_variable" "worker_pool_subnets" {
  stack_id = "demo-worker-pool"
  name     = "TF_VAR_worker_pool_subnets"
  value    = jsonencode([data.aws_subnets.dev_public_subnets])
}


module "my_workerpool" {
  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v1.3.0"

  configuration = <<-EOT
    export SPACELIFT_TOKEN="${var.worker_pool_config}"
    export SPACELIFT_POOL_PRIVATE_KEY="${var.worker_pool_private_key}"
  EOT

  min_size        = 1
  max_size        = 1
  worker_pool_id  = spacelift_worker_pool.demo-ASG.id
  security_groups = data.aws_security_groups.dev_sg.ids
  vpc_subnets     = data.aws_subnets.dev_public_subnets.ids
}