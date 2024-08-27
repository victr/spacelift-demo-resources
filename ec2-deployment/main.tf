resource "aws_instance" "demo-instance" {
  ami           = data.aws_ami.dev_server_ami.id
  instance_type = var.instance_type

  tags = {
    demo = "resource"
  }
}

variable "instance_type" {
}