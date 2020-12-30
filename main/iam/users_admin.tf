# module "rytswd" {
#   source = "./modules/user"

#   aws_username       = "rytswd"
#   aws_keybase_userid = "rytswd"
#   aws_resources = [
#     local.aws_iam_admin,
#     local.aws_v01_admin,
#     local.aws_v02_admin,
#   ]
# }
# // Can be commented out once used
# output "rytswd_keybase_decrypt" {
#   value = module.rytswd.user_keybase_decrypt
# }
