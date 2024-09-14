variable "instance_type" {
  type        = string
  description = "Specify instance type."
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "Specify a name for this instance"
  default     = "dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}