provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region

  assume_role {
    role_arn = local.assumed_role
  }
}
provider "google" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  project = "rytswd-get-multi-cloud-k8s-v01"
  alias   = "v01"
}

provider "google-beta" {
  version = "~> 3.33.0"
  region  = var.gcp_region
  project = "rytswd-get-multi-cloud-k8s-v01"
  alias   = "v01"
}


module "aws_networking" {
  source = "./modules/network"
  providers = {
    google = google.v01
  }

  gcp_region = "europe-west2"
  gcp_cidr   = "10.12.0.0/16"

  aws_region = "eu-west-2"
  aws_cidr   = "10.22.0.0/16"
}
