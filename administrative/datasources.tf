data "spacelift_current_space" "this" {}

output "test" {
  value = data.spacelift_current_space.this
}