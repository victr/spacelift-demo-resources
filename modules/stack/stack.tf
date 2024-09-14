resource "spacelift_stack" "this" {
  space_id                     = var.space_id
  branch                       = var.branch
  description                  = var.description
  name                         = var.name
  project_root                 = var.project_root
  repository                   = var.repository
  terraform_smart_sanitization = true
  administrative               = false
  terraform_workflow_tool      = "OPEN_TOFU"

  dynamic "github_enterprise" {
    for_each = var.github_organization == null ? [] : [true]
    content {
      namespace = var.github_organization
    }
  }
}

