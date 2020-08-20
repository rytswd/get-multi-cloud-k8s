module "rytswd" {
  source = "./admin"

  aws_username       = "rytswd"
  aws_keybase_userid = "rytswd"
  aws_resources = [
    local.aws_iam_admin,
    local.aws_v01_admin,
    local.aws_v02_admin,
  ]
}
// Can be commented out once used
output "rytswd_keybase_decrypt" {
  value = module.rytswd.keybase_password_decrypt_command
}
