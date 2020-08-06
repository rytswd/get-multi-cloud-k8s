resource "google_compute_network" "multi_cloud_gcp" {
  name                    = "multi-cloud-gcp"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "multi_cloud_gcp_subnet" {
  name          = "multi-cloud-gcp-subnet"
  ip_cidr_range = var.gcp_cidr
  network       = google_compute_network.multi_cloud_gcp.self_link
}
