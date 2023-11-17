resource "spacelift_space" "demo-resources" {
  name             = "demo-resources"
  inherit_entities = true
  depends_on = [
    spacelift_blueprint.AWS-environment,
    spacelift_policy.check-instance-type,
    spacelift_policy.require-two-approvals,
    spacelift_stack.demo-worker-pool,
    spacelift_stack_destructor.EC2-deployment
  ]
}