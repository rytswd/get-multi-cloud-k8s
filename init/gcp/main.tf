resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  service = each.key

  project            = var.gcp_project
  disable_on_destroy = false
}
