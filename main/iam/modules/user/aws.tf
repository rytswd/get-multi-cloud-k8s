module "aws_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.18.0"

  name    = var.aws_username
  pgp_key = "keybase:${var.aws_keybase_userid}"

  force_destroy           = true
  password_reset_required = true
}
data "aws_iam_policy_document" "user" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.aws_resources
  }
}
resource "aws_iam_user_policy" "user" {
  name   = "AssumeRoleFor_${var.aws_username}"
  user   = module.aws_user.this_iam_user_name
  policy = data.aws_iam_policy_document.user.json
}
