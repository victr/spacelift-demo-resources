locals {
  switch_statement = format("%s : 'UNNKOWN'", join(" : ", [
    for integration in data.spacelift_aws_integrations.this.integrations :
    format("inputs.integration == '%s' ? '%s'", integration.name, integration.integration_id)
  ]))
  func_integrations_switch_statement = format("$${{ %s }}", local.switch_statement)
}

resource "spacelift_blueprint" "AWS-environment" {
  name        = "AWS-Environment"
  description = "Environment for AWS"
  space       = spacelift_space.demo-resources.id
  template    = templatefile("${path.root}./blueprints/aws_env.tftpl", { integrations = data.spacelift_aws_integrations.this.integrations, func_integrations_switch_statement = local.func_integrations_switch_statement })
  state       = "PUBLISHED"
  labels      = ["dev"]
} 