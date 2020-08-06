provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region

  assume_role {
    role_arn = local.assumed_role
  }
}
provider "google" {
  version = "~> 2.10"
  region  = var.gcp_region
}

provider "google-beta" {
  version = "~> 2.10"
  region  = var.gcp_region
}


module "aws_networking" {
  source = "../modules/network"

  aws_region = "eu-west-2"
  aws_cidr   = "10.22.0.0/16"
}
