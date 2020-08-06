/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
module "aws_init" {
  source = "./aws"
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
module "gcp_init" {
  source = "./gcp"
}

