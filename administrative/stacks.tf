
resource "spacelift_stack" "EC2-deployment" {
  space_id                     = spacelift_space.demo-resources.id
  branch                       = "main"
  description                  = "this stack will deploy a basic ec2 instance"
  name                         = "EC2-deployment"
  project_root                 = "ec2-deployment"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  raw_git {
    namespace = var.namespace
    url       = var.url
  }
}

resource "spacelift_stack_destructor" "EC2-deployment" {
  depends_on = [
    spacelift_policy_attachment.check-instance-type-attachment,
    spacelift_policy_attachment.require-two-approvals-attachment
  ]
  stack_id = spacelift_stack.EC2-deployment.id
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

resource "spacelift_stack_destructor" "demo-worker-pool" {
  stack_id = spacelift_stack.demo-worker-pool.id
}

