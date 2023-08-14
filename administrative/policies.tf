resource "spacelift_policy" "default-login-ploicy" {
  name = "default login"
  body = file("../policies/login/default-login.rego")
  type = "LOGIN"
  # space_id = "demo-resources-01H7T746B176K9S5MH0N63MGPH"
}