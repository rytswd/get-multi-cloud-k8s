provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
}

module "aws_init" {
  source = "./aws"

  project_name  = "rytswd-get-multi-cloud-k8s-v0.1"
  project_email = "rytswd+multicloud-k8s-v0.1@gmail.com"
}
