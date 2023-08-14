data "spacelift_current_space" "this" {}

output "id" {
  value = data.spacelift_current_space.this
}