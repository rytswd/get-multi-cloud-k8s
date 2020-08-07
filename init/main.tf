/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
module "aws_init" {
  source = "./aws"

  project_name  = "rytswd-get-multi-cloud-k8s-v0.1"
  project_email = "rytswd+multicloud-k8s-v0.1@gmail.com"
}
output "aws_terraform_admin_access_key_id" {
  value = module.aws_init.terraform_admin_access_key_id
}
output "aws_terraform_admin_access_key_encrypted_secret" {
  value = module.aws_init.terraform_admin_access_key_encrytped_secret
}

/* ----------------------------------------------------------------------------
    GCP
------------------------------------------------------------------------------- */
# NOTE: 
#   Because creating GCP project via Terraform requires an organization, this
#   setup is being skipped. Instead, you can use gcloud CLI to get started with
#   the initial project setup.
#   Inside this module, it is only setting the project APIs.
module "gcp_init" {
  source = "./gcp"

  gcp_project = "rytswd-get-multi-cloud-k8s-v01"
}

