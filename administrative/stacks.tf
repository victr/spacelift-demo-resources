
resource "spacelift_stack" "EC2-deployment" {
  space_id                     = spacelift_space.demo-resources.id
  branch                       = "main"
  description                  = "this stack will deploy a basic ec2 instance"
  name                         = "EC2-deployment"
  project_root                 = "aws-module"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  raw_git {
    namespace = var.namespace
    url       = var.url
  }
}

resource "spacelift_stack" "module-deployment" {
  space_id                     = spacelift_space.demo-resources.id
  branch                       = "main"
  description                  = "this stack will deploy a basic ec2 instance"
  name                         = "EC2 module deploymentusing an AWS EC2 module"
  project_root                 = "aws-module"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  raw_git {
    namespace = var.namespace
    url       = var.url
  }
}

resource "spacelift_stack" "demo-worker-pool" {
  administrative               = true
  space_id                     = spacelift_space.demo-resources.id
  branch                       = "main"
  description                  = "This stack will be in charge of creating our worker pool"
  name                         = "demo-worker-pool"
  project_root                 = "worker-pool"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  raw_git {
    namespace = var.namespace
    url       = var.url
  }
}


module "test-stack" {
  source     = "../modules/stack"
  name       = "module-test-stack"
  space_id   = spacelift_space.demo-resources.id
  repository = "demo-resources"
}