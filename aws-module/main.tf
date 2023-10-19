module "ec2-environment" {
  source  = "spacelift.io/saturnhead/ec2-environment/aws"
  version = "0.1.2"

  # Required inputs 
  instance_type = var.instance_size
  node_name     = var.node_name
}