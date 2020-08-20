module "rytswd" {
  source = "./admin"

  aws_username       = "rytswd"
  aws_keybase_userid = "rytswd"
  aws_resources = [
    local.aws_iam_admin,
    local.aws_v91_admin,
    local.aws_v02_admin,
  ]
}
