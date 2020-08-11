resource "google_container_cluster" "cluster" {
  name     = var.gcp_cluster_name
  location = var.gcp_region

  # Remove default node pool immediately after 
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.gcp_vpc
  subnetwork = var.gcp_subnet

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.gcp_pod_ip_cidr
    services_ipv4_cidr_block = var.gcp_svc_ip_cidr
  }
}

resource "google_container_node_pool" "n1_preemptible_pool" {
  count = var.enable_n1_preemptible_pool ? 1 : 0

  name     = "n1-preemptible"
  location = var.gcp_region

  cluster    = google_container_cluster.cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
  }
}

resource "google_container_node_pool" "shared_e2_preemptible_pool" {
  count = var.enable_e2_shared_preemptible_pool ? 1 : 0

  name     = "e2-shared-preemptible"
  location = var.gcp_region

  cluster    = google_container_cluster.cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}
