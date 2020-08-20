provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = local.aws_assumed_role
  }
}

# provider "google" {
#   region  = var.gcp_region
#   project = var.gcp_project
#   alias   = "v01"
# }

# provider "google-beta" {
#   region  = var.gcp_region
#   project = var.gcp_project
#   alias   = "v01"
# }
