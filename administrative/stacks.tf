# resource "spacelift_stack" "Admin-stack" {
#   administrative    = true
#   space_id = "root"
#   branch            = "main"
#   description       = "The admin/manager stack that will deploy all spacelift resources"
#   name              = "Admin-stack"
#   project_root      = "administrative"
#   repository        = "demo-resources"
#   terraform_smart_sanitization = true
#   github_enterprise {
#     namespace = "jubranNassar"
#   }
# }

resource "spacelift_stack" "EC2-deployment" {
  space_id                     = data.spacelift_current_space.this.id
  branch                       = "main"
  description                  = "this stack will deploy a basic ec2 instance"
  name                         = "EC2-deployment"
  project_root                 = "ec2-deployment"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  github_enterprise {
    namespace = "jubranNassar"
  }
}

resource "spacelift_stack" "demo-worker-pool" {
  administrative               = true
  space_id                     = data.spacelift_current_space.this.id
  branch                       = "main"
  description                  = "This stack will be in charge of creating our worker pool"
  name                         = "demo-worker-pool"
  project_root                 = "worker-pool"
  repository                   = "demo-resources"
  terraform_smart_sanitization = true
  github_enterprise {
    namespace = "jubranNassar"
  }
}