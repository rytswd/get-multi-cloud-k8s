provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
  alias   = "v01"

  assume_role {
    role_arn = local.aws_account_role
  }
}

provider "google" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  project = var.gcp_project
  alias   = "v01"
}

provider "google-beta" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  project = var.gcp_project
  alias   = "v01"
}
