/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
output "aws_account_id" {
  value = module.aws_init.account_id
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
