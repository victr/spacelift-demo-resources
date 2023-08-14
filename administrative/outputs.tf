data "spacelift_space" "space" {
  space_id = spacelift_space.space.id
}

output "description" {
  value = data.spacelift_space.space.description
}