terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.1.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.51.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.51.0"
    }
  }
  required_version = ">= 0.13"
}
