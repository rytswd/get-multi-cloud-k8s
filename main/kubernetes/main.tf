module "networking" {
  source = "./modules/network"
  providers = {
    aws    = aws.v01
    google = google.v01
  }

  aws_region = var.aws_region
  aws_cidr   = var.aws_cidr

  gcp_region = var.gcp_region
  gcp_cidr   = var.gcp_cidr
}

module "vpn" {
  source = "./modules/vpn"
  providers = {
    aws             = aws.v01
    google          = google.v01
    google-beta.vpn = google-beta.v01
  }

  vpn_cidr_base = "169.254.10.0/26"
  preshared_key = "Yw9hTWYWm5AO5RuEvGe4OAAfVUdi0gil"

  aws_region  = var.aws_region
  aws_vpc     = module.networking.aws_vpc
  aws_subnets = module.networking.aws_subnets
  aws_bgp_asn = "65010"

  gcp_region  = var.gcp_region
  gcp_vpc     = module.networking.gcp_vpc
  gcp_bgp_asn = "65020"
}

module "gke" {
  source = "./modules/kubernetes"
  providers = {
    aws             = aws.v01
    google          = google.v01
    google-beta.vpn = google-beta.v01
  }

  gcp_region = var.gcp_region
  gcp_vpc    = module.networking.gcp_vpc
  gcp_subnet = module.networking.gcp_subnet

  gcp_cluster_name           = "kubernetes-v01"
  gcp_pod_ip_cidr            = var.gcp_pod_ip_cidr
  gcp_svc_ip_cidr            = var.gcp_svc_ip_cidr
  gcp_kubernetes_min_version = "1.17.9-gke.600"

  enable_n1_preemptible_pool        = false
  enable_e2_shared_preemptible_pool = true
}


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
