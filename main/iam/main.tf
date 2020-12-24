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
