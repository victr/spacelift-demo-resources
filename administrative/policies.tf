resource "spacelift_policy" "default-login-policy" {
  name     = "default login"
  body     = file("../policies/login/default-login.rego")
  type     = "LOGIN"
  space_id = "root"
}

resource "spacelift_policy" "check-instance-type" {
  name     = "check-instance-type"
  body     = file("../policies/plan/check-instance-type.rego")
  type     = "PLAN"
  space_id = "demo-resources-01H7T746B176K9S5MH0N63MGPH"
}

resource "spacelift_policy" "require-two-approvals" {
  name     = "require-two-approvals"
  body     = file("../policies/approval/require-two-approvals.rego")
  type     = "APPROVAL"
  space_id = "demo-resources-01H7T746B176K9S5MH0N63MGPH"
}