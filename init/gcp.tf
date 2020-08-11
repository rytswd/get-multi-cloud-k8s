# NOTE: 
#   Because creating GCP project via Terraform requires an organization, this
#   setup is being skipped. Instead, you can use gcloud CLI to get started with
#   the initial project setup.
#
#   Inside this module, it is only setting the project APIs.

provider "google" {
  region  = var.gcp_region
  project = "get-multi-cloud-k8s-admin"
}

/* ----------------------------------------------------------------------------
    GCP
      For get-multi-cloud-k8s-admin
------------------------------------------------------------------------------- */
resource "google_project_service" "admin" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  service = each.key

  project            = "get-multi-cloud-k8s-admin"
  disable_on_destroy = false
}

/* ----------------------------------------------------------------------------
    GCP
      For rytswd-get-multi-cloud-k8s-v01
------------------------------------------------------------------------------- */
resource "google_project_service" "v01" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  service = each.key

  project            = "rytswd-get-multi-cloud-k8s-v01"
  disable_on_destroy = false
}

/* ----------------------------------------------------------------------------
    GCP
      For rytswd-get-multi-cloud-k8s-v02
------------------------------------------------------------------------------- */
resource "google_project_service" "v02" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  service = each.key

  project            = "rytswd-get-multi-cloud-k8s-v02"
  disable_on_destroy = false
}
