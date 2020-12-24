resource "google_container_cluster" "cluster" {
  name     = var.gcp_cluster_name
  location = var.gcp_region

  release_channel {
    channel = "RAPID"
  }
  min_master_version = var.gcp_kubernetes_min_version

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

  autoscaling {
    min_node_count = 1
    max_node_count = 4
  }

  management {
    auto_repair  = true
    auto_upgrade = true
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

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}


# Below for refernece only

# data "google_compute_zones" "available" {
#   provider = google.v01
# }
# module "gke" {
#   source = "terraform-google-modules/kubernetes-engine/google"
#   providers = {
#     google          = google.v01
#     google-beta.vpn = google-beta.v01
#   }

#   project_id = var.gcp_project
#   name       = "kubernetes-for-v01"
#   region     = var.gcp_region
#   zones      = data.google_compute_zones.available.names

#   network    = module.networking.gcp_vpc
#   subnetwork = var.gcp_cidr

#   ip_range_pods     = "pod_ip_range"
#   ip_range_services = "svc_ip_range"

#   node_pools = [
#     {
#       name               = "shared-core-pool-small"
#       machine_type       = "e2-small"
#       preemptible        = true
#       initial_node_count = 1
#     },
#     # {
#     #   name               = "standard-n1-pool"
#     #   machine_type       = "n1-standard-1"
#     #   preemptible        = true
#     #   initial_node_count = 1
#     # },
#     # {
#     #   name               = "standard-e2-pool"
#     #   machine_type       = "e2-standard-2"
#     #   preemptible        = true
#     #   initial_node_count = 1
#     # },
#   ]
# }
