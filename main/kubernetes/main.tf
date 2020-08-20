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

module "logging" {
  count = var.enable_logging ? 1 : 0

  source = "./modules/logging"
  providers = {
    aws    = aws.v01
    google = google.v01
  }

  aws_vpc         = module.networking.aws_vpc
  aws_bucket_name = "rytswd-get-multi-cloud-k8s-v01-vpc-log"
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

module "kubernetes" {
  source = "./modules/kubernetes"
  providers = {
    aws             = aws.v01
    google          = google.v01
    google-beta.vpn = google-beta.v01
  }

  aws_cluster_name    = "kubernetes-v01-eks"
  aws_cluster_version = "1.16"
  aws_vpc             = module.networking.aws_vpc
  aws_subnets         = module.networking.aws_subnets

  gcp_region = var.gcp_region
  gcp_vpc    = module.networking.gcp_vpc
  gcp_subnet = module.networking.gcp_subnet

  gcp_cluster_name           = "kubernetes-v01-gke"
  gcp_kubernetes_min_version = "1.16.13-gke.1"
  gcp_pod_ip_cidr            = var.gcp_pod_ip_cidr
  gcp_svc_ip_cidr            = var.gcp_svc_ip_cidr

  enable_n1_preemptible_pool        = false
  enable_e2_shared_preemptible_pool = true
}

# ---

module "admin_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "2.18.0"

  role_name = "admin"
  role_path = "/"

  create_role         = true
  attach_admin_policy = true
  role_requires_mfa   = false

  trusted_role_arns = [
    local.iam_account_arn,
  ]
}
