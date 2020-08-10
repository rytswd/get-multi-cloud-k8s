output "terraform_admin_access_key_id" {
  value = aws_iam_access_key.terraform_admin.id
}
output "terraform_admin_access_key_encrytped_secret" {
  value = aws_iam_access_key.terraform_admin.encrypted_secret
}

output "v01_id" {
  value = aws_organizations_account.v01.id
}
output "v02_id" {
  value = aws_organizations_account.v02.id
}
