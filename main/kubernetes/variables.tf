/* ----------------------------------------------------------------------------
    Module Control
------------------------------------------------------------------------------- */
variable "enable_logging" {
  default     = false
  description = "Enable logging setup."
}

variable "enable_kubernetes" {
  default     = true
  description = "Enable Kubernetes setup."
}

/* ----------------------------------------------------------------------------
    Retrieve Backend Data from Init
------------------------------------------------------------------------------- */
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

  aws_account_iam_arn = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_account_iam_id}:user/rytswd"

  aws_iam_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_account_iam_id}:role/${local.aws_admin_role_name}"
  aws_v01_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v01_account_id}:role/${local.aws_admin_role_name}"
  aws_v02_admin = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v02_account_id}:role/${local.aws_admin_role_name}"
}

/* ----------------------------------------------------------------------------
    AWS

      Quick Reference:
      - ap-east-1:      Hong Kong
      - ap-northeast-1: Tokyo
      - eu-west-1:      Ireland
      - eu-west-2:      London
      - us-east-1:      N. Virginia
      - us-west-1:      N. California
      - us west-2:      Oregon
------------------------------------------------------------------------------- */
variable "aws_region" {
  default = "eu-west-2"
}

variable "aws_cidr" {
  default = "10.22.0.0/16"
}

/* ----------------------------------------------------------------------------
    GCP

      Quick Reference:
      - asia-east1:      Taiwan
      - asia-northeast1: Tokyo
      - europe-west2:    London
      - us-east4:        Northern Virginia
      - us-west1:        Oregon
------------------------------------------------------------------------------- */
variable "gcp_region" {
  default = "europe-west2"
}

variable "gcp_project" {
  default = "rytswd-get-multi-cloud-k8s-v01"
}

variable "gcp_cidr" {
  default = "10.12.0.0/16"
}
variable "gcp_pod_ip_cidr" {
  default = "10.13.0.0/16"
}
variable "gcp_svc_ip_cidr" {
  default = "10.14.0.0/16"
}


/* ----------------------------------------------------------------------------
    Computed values below
------------------------------------------------------------------------------- */

locals {
  # Given Terraform IAM user is created at root account, it can assume a orole
  # called "OrganizationAccountAccessRole", which is automatically created in a
  # new AWS account.
  v1_aws_assumed_role = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v01_account_id}:role/OrganizationAccountAccessRole"
  v2_aws_assumed_role = "arn:aws:iam::${data.terraform_remote_state.init.outputs.aws_v02_account_id}:role/OrganizationAccountAccessRole"
}
