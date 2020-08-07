provider "google" {
  project = var.gcp_project # TODO: in org setup, this should be a parent project
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

# resource "google_project" "new_project" {
#   name            = var.gcp_project
#   project_id      = var.gcp_project
#   billing_account = local.billing_account
#   org_id          = local.org_id
# }

resource "google_project_service" "service" {
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  service = each.key

  project            = var.gcp_project
  disable_on_destroy = false
}
