# data "spacelift_aws_integration" "this" {
#   name = var.aws_integration
# }

data "spacelift_aws_integrations" "this" {}

# data "spacelift_stack" "ec2-deployment" {
#   stack_id = "ec2-deployment"
# }

# data "spacelift_stack" "demo-worker-pool" {
#   stack_id = "demo-worker-pool"
# }