data "terraform_remote_state" "init" {
  backend = "remote"

  config = {
    organization = "rytswd"
    workspaces = {
      name = "get-multi-cloud-k8s-init"
    }
  }
}

locals {
  aws_assumed_role    = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_account_iam_id}:role/OrganizationAccountAccessRole"
  aws_admin_role_name = data.terraform_remote_state.init.outputs.aws_admin_role_name

  aws_iam_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_account_iam_id}:role/${local.aws_admin_role_name}"
  aws_v01_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v01_account_id}:role/${local.aws_admin_role_name}"
  aws_v02_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v02_account_id}:role/${local.aws_admin_role_name}"
}

variable "aws_region" {
  default = "eu-west-2"
}
# variable "aws_admin_role_name" {
#   default     = data.terraform_remote_state.init.outputs.aws_admin_role_name
#   description = "Admin role name. The default is provided by a shared variable from init project."
# }
