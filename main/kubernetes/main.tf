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

  link_local_cidr_base = "169.254.10.0/26"
  preshared_key        = "BHVzR6Xj3V1gQEOdJm5RMMGX6/7QataZ"

  aws_region  = "eu-west-2"
  aws_vpc     = module.networking.aws_vpc
  aws_subnets = module.networking.aws_subnets
  aws_bgp_asn = "64321"

  gcp_region  = "europe-west2"
  gcp_vpc     = module.networking.gcp_vpc
  gcp_bgp_asn = "64567"
}


