provider "aws" {
  region = var.aws_region
}

module "aws_init" {
  source = "./aws"

  project_name_v01  = "rytswd-get-multi-cloud-k8s-v0.1"
  project_email_v01 = "rytswd+multicloud-k8s-v0.1@gmail.com"
  project_name_v02  = "rytswd-get-multi-cloud-k8s-v0.2"
  project_email_v02 = "rytswd+multicloud-k8s-v0.2@gmail.com"
}
