
resource "time_sleep" "buffer" {
  destroy_duration = "5s"
  depends_on       = [spacelift_space.demo-resources]
}


module "EC2-deployment" {
  source       = "../modules/stack"
  space_id     = spacelift_space.demo-resources.id
  name         = "EC2-deployment"
  project_root = "aws-module"
  description  = "this stack will deploy a basic ec2 instance"
  depends_on   = [time_sleep.buffer]
}



module "demo-worker-pool" {
  source       = "../modules/stack"
  space_id     = spacelift_space.demo-resources.id
  name         = "demo-worker-pool"
  project_root = "worker-pool"
  description  = "This stack will be in charge of creating our worker pool"
  depends_on   = [time_sleep.buffer]
}