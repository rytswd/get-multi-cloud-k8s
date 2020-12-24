# Citation:
# There is only a single policy allowed per AWS account. An existing policy
# will be lost when using this resource as an effect of this limitation.
# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy
resource "aws_iam_account_password_policy" "default" {
  minimum_password_length        = 12
  max_password_age               = 90
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 2
}

module "admin_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "2.18.0"

  role_name = local.aws_admin_role_name
  role_path = "/"

  create_role         = true
  attach_admin_policy = true
  role_requires_mfa   = false

  #   trusted_role_arns = [
  #     local.aws_account_iam_arn,
  #   ]
}

module "member_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "2.18.0"

  role_name = "Member"
  role_path = "/"

  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
    # "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess",
  ]

  #   trusted_role_arns = [
  #     local.aws_account_iam_arn,
  #   ]
}
