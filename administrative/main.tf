resource "spacelift_stack" "Admin stack" {
  administrative    = true
  branch            = "main"
  description       = "The admin/manager stack that will deploy all spacelift resources"
  name              = "Admin stack"
  project_root      = "administrative"
  repository        = "demo-resources"
  terraform_smart_sanitization = true
  github_enterprise {
    namespace = "jubranNassar"
  }
}