module "networking" {
  source = "./modules/network"
  providers = {
    aws    = aws.v01
    google = google.v01
  }

  aws_region = "eu-west-2"
  aws_cidr   = "10.22.0.0/16"

  gcp_region = "europe-west2"
  gcp_cidr   = "10.12.0.0/16"
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

  aws_region  = "eu-west-2"
  aws_vpc     = module.networking.aws_vpc
  aws_subnets = module.networking.aws_subnets
  aws_bgp_asn = "65010"

  gcp_region  = "europe-west2"
  gcp_vpc     = module.networking.gcp_vpc
  gcp_bgp_asn = "65020"
}


