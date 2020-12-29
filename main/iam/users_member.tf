module "some_member" {
  source = "./modules/user"

  aws_username       = "some_member"
  aws_keybase_userid = "rytswd"
  aws_resources = [
    local.aws_iam_member,
    local.aws_v01_member,
  ]
}
// Can be commented out once used
output "some_member_keybase_decrypt" {
  value = module.some_member.user_keybase_decrypt
}
