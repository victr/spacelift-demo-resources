
module "EC2-deployment" {
  source       = "../modules/stack"
  name         = "EC2-deployment"
  project_root = "aws-module"
  description  = "this stack will deploy a basic ec2 instance"
}


module "demo-worker-pool" {
  source       = "../modules/stack"
  name         = "demo-worker-pool"
  project_root = "worker-pool"
  description  = "This stack will be in charge of creating our worker pool"
}
