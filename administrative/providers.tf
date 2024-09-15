terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.15.0"
    }
    time = {
      source  = "opentofu/time"
      version = "0.12.0"
    }
  }
}

provider "spacelift" {}
provider "time" {}