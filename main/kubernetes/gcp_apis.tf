resource "google_project_service" "compute" {
  project = var.gcp_project
  service = "compute.googleapis.com"
}
resource "google_project_service" "cloudresource" {
  project = var.gcp_project
  service = "cloudresourcemanager.googleapis.com"
}
