/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
output "aws_v01_account_id" {
  value = module.aws.v01_id
}
output "aws_v02_account_id" {
  value = module.aws.v02_id
}
output "aws_terraform_admin_access_key_id" {
  value = module.aws.terraform_admin_access_key_id
}
output "aws_terraform_admin_access_key_encrypted_secret" {
  value = module.aws.terraform_admin_access_key_encrytped_secret
}

output "aws_account_iam_id" {
  value = module.aws_init.project_iam_id
}
# output "aws_terraform_admin_access_key_id" {
#   value = module.aws_init.terraform_admin_access_key_id
# }
# output "aws_terraform_admin_access_key_encrypted_secret" {
#   value = module.aws_init.terraform_admin_access_key_encrytped_secret
# }
output "aws_terraform_super_admin_access_key_id" {
  value = module.aws_init.terraform_super_admin_access_key_id
}
output "aws_terraform_super_admin_access_key_encrypted_secret" {
  value = module.aws_init.terraform_super_admin_access_key_encrytped_secret
}

/* ----------------------------------------------------------------------------
    GCP
------------------------------------------------------------------------------- */
# None
