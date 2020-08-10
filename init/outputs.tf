/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
output "aws_v01_account_id" {
  value = module.aws_init.v01_id
}
output "aws_v02_account_id" {
  value = module.aws_init.v02_id
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
# None
