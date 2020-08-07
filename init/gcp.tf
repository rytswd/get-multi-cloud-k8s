# NOTE: 
#   Because creating GCP project via Terraform requires an organization, this
#   setup is being skipped. Instead, you can use gcloud CLI to get started with
#   the initial project setup.
#
#   Inside this module, it is only setting the project APIs.

/* ----------------------------------------------------------------------------
    GCP
      For rytswd-get-multi-cloud-k8s-v01
------------------------------------------------------------------------------- */
locals {
  project_v01 = "rytswd-get-multi-cloud-k8s-v01"
}
provider "google" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  # If used in Org setup with G Suite, this should be the parent Org. Because
  # this setup assumes personal account, each project will be created outside
  # of Terraform, and we use separate providers for each project.
  project = local.project_v01
  alias   = "v01"
}
module "gcp_init" {
  source = "./gcp"
  providers = {
    google = google.v01
  }

  gcp_project = local.project_v01
}

/* ----------------------------------------------------------------------------
    GCP
      For rytswd-get-multi-cloud-k8s-v02
------------------------------------------------------------------------------- */
locals {
  project_v02 = "rytswd-get-multi-cloud-k8s-v02"
}
provider "google" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  # If used in Org setup with G Suite, this should be the parent Org. Because
  # this setup assumes personal account, each project will be created outside
  # of Terraform, and we use separate providers for each project.
  project = local.project_v02
  alias   = "v02"
}
module "gcp_init" {
  source = "./gcp"
  providers = {
    google = google.v02
  }

  gcp_project = local.project_v02
}
