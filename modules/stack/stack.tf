resource "spacelift_stack" "this" {
  space_id                     = var.space_id
  branch                       = var.branch
  description                  = var.description
  name                         = var.name
  project_root                 = var.project_root
  repository                   = var.repository
  terraform_smart_sanitization = true
  administrative               = false

  raw_git {
    namespace = var.namespace
    url       = var.url
  }
}