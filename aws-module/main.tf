module "ec2-environment" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = var.instance_name
  # Required inputs 
  instance_type = var.instance_size
  ami           = data.aws_ami.dev_server_ami.id
}