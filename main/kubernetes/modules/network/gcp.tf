provider "google" {
  version = "~> 3.33.0"
  region  = var.gcp_region
}

resource "google_compute_network" "multi_cloud_gcp" {
  name                    = "multi-cloud-gcp"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "multi_cloud_gcp_subnet" {
  name          = "multi_cloud_gcp_subnet"
  ip_cidr_range = var.gcp_cidr
  network       = google_compute_network.main.self_link
}
