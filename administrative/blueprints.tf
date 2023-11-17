resource "spacelift_blueprint" "AWS-environment" {
  name        = "AWS-Environment"
  description = "Environment for AWS"
  space       = spacelift_space.demo-resources.id
  template    = templatefile("${path.root}./blueprints/aws_env.tftpl", { integrations = data.spacelift_aws_integrations.this.integrations })
  state       = "PUBLISHED"
  labels      = ["dev"]
}