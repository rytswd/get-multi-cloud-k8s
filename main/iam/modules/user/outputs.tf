
output "user_keybase_decrypt" {
  value = module.aws_user.keybase_password_decrypt_command
}

output "user_keybase_pgp" {
  value = module.aws_user.keybase_password_pgp_message
}

output "user_encrypted_password" {
  value = module.aws_user.this_iam_user_login_profile_encrypted_password
}
