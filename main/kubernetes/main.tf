module "networking" {
  source = "./modules/network"
  providers = {
    google = google.v01
    aws    = aws.v01
  }

  gcp_region = "europe-west2"
  gcp_cidr   = "10.12.0.0/16"

  aws_region = "eu-west-2"
  aws_cidr   = "10.22.0.0/16"
}

module "vpn" {
  source = "./modules/vpn"
  providers = {
    aws         = aws.v01
    google      = google.v01
    google-beta = google-beta.v01
  }

  aws_region  = "eu-west-2"
  aws_vpc     = module.networking.aws_vpc
  aws_subnets = module.networking.aws_subnets
  aws_bgp_asn = "64321"

  gcp_region  = "europe-west2"
  gcp_vpc     = module.networking.gcp_vpc
  gcp_bgp_asn = "64567"
}


