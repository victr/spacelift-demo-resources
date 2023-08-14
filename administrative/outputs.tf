data "spacelift_space" "demo-resources" {
  space_id = spacelift_space.demo-resources.id
}

output "space" {
    value = data.spacelift_space.demo-resources
}