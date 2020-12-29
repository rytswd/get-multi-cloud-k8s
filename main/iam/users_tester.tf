module "some_tester" {
  source = "./modules/user"

  aws_username       = "some_tester"
  aws_keybase_userid = "rytswd"
  aws_resources = [
    local.aws_iam_member,
    local.aws_v01_member,
  ]
}
// Can be commented out once used
output "some_tester_keybase_decrypt" {
  value = module.some_tester.keybase_password_decrypt_command
}
