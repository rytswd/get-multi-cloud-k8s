terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.1.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.33.0"
    }
  }
  required_version = ">= 0.13"
}
