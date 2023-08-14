resource "spacelift_policy" "default-login-ploicy" {
  name = "default login"
  body = file("../policies/login/default-login.rego")
  type = "LOGIN"
  space_id = output.id.value
}