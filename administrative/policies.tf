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
  space_id = data.spacelift_current_space.this.id
}

resource "spacelift_policy_attachment" "check-instance-type" {
  policy_id = spacelift_policy.check-instance-type.id
  stack_id  = spacelift_stack.EC2-deployment.id
}

resource "spacelift_policy" "require-two-approvals" {
  name     = "require-two-approvals"
  body     = file("../policies/approval/require-two-approvals.rego")
  type     = "APPROVAL"
  space_id = data.spacelift_current_space.this.id
}