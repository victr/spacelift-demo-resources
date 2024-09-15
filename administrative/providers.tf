terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.15.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.12.1"
    }
  }
}

provider "spacelift" {}