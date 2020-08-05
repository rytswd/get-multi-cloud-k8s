provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}

resource "aws_organizations_account" "get_multi_cloud_k8s" {
  name  = "get-multi-cloud-k8s"
  email = "rytswd+multicloudk8s@gmail.com"
}

/* ----------------------------------------------------------------------------
    2. TerraformAdmin setup

      Create user account "TerraformAdmin" so that it can assume role from
      other accounts. Other user accounts which require Assume Role access
      should use separate setup.
------------------------------------------------------------------------------- */
data "aws_iam_policy_document" "terraform_admin" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["*"]
  }
}
resource "aws_iam_user" "terraform_admin" {
  name = "TerraformAdmin"
  path = "/"
}
resource "aws_iam_user_policy" "terraform_admin_assume_role" {
  name   = "AssumeRoleForTerraformAdmin"
  user   = aws_iam_user.terraform_admin.name
  policy = data.aws_iam_policy_document.terraform_admin.json
}
