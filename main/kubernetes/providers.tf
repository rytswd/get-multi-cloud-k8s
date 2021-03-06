provider "aws" {
  region = var.aws_region
  alias  = "v01"

  assume_role {
    role_arn = local.v1_aws_assumed_role
  }
}

provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
  alias   = "v01"
}

provider "google-beta" {
  region  = var.gcp_region
  project = var.gcp_project
  alias   = "v01"
}
