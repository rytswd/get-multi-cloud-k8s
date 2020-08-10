
/* ----------------------------------------------------------------------------
    TerraformAdmin setup

      Create user account "TerraformAdmin" so that it can assume role from
      other accounts. Other user accounts which require Assume Role access
      should use separate setup.
------------------------------------------------------------------------------- */
resource "aws_iam_user" "terraform_admin" {
  name = "TerraformAdmin"
  path = "/"
}

data "aws_iam_policy_document" "terraform_admin" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}
resource "aws_iam_user_policy" "terraform_admin_assume_role" {
  name   = "TerraformAdminAccess"
  user   = aws_iam_user.terraform_admin.name
  policy = data.aws_iam_policy_document.terraform_admin.json
}
# resource "aws_iam_access_key" "terraform_admin" {
#   user    = aws_iam_user.terraform_admin.name
#   pgp_key = "keybase:rytswd"
# }

/* ----------------------------------------------------------------------------
    Multi Account Setup

      Create an organization account, and then creates the child accounts.
------------------------------------------------------------------------------- */
resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "v01" {
  name  = var.project_name_v01
  email = var.project_email_v01
}
resource "aws_organizations_account" "v02" {
  name  = var.project_name_v02
  email = var.project_email_v02
}

