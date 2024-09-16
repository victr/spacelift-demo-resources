variable "branch" {
  type    = string
  default = "main"
}

variable "description" {
  type    = string
  default = null
}

variable "space_id" {
  type = string
}

variable "name" {
  type = string
}

variable "project_root" {
  type    = string
  default = null
}

variable "repository" {
  type    = string
  default = "demo-resources"
}


variable "github_organization" {
  type    = string
  default = "jubranNassar"
}

# variable "gitlab_organization" {
#     type = string
# }

variable "aws_integration" {
  type    = string
  default = "jubran-aws-account"
}