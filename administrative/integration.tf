# Needed for generating the correct role ARNs
data "aws_caller_identity" "current" {}

locals {
  role_name = "my_role"
  role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.role_name}"
}

# Create the AWS integration before creating your IAM role. The integration needs to exist
# in order to generate the external ID used for role assumption.
resource "spacelift_aws_integration" "this" {
  name = "aws-integration"

  # We need to set the ARN manually rather than referencing the role to avoid a circular dependency
  role_arn                       = local.role_arn
  generate_credentials_in_worker = false
  space_id                       = data.spacelift_current_space.this.id
}

data "spacelift_aws_integration_attachment_external_id" "ec2-deployment-stack" {
  integration_id = spacelift_aws_integration.this.id
  stack_id       = "ec2-deployment"
  read           = true
  write          = true
}
