variable "aws_region" {
  default = "eu-west-2"
}

variable "aws_account" {
  description = "AWS Account ID in 12 digit representation."
  default     = "953930786689"
}

variable "gcp_region" {
  default = "europe-west2"
}

variable "gcp_project" {
  default = "rytswd-get-multi-cloud-k8s-v01"
}


#* ---------------------------------------------------------------------------- *#
#     Computed values below
#* ---------------------------------------------------------------------------- *#

locals {
  # Given Terraform IAM account is created at root account, it can assume a
  # role called "OrganizationAccountAccessRole", which is automatically created
  # in a new AWS account.
  aws_account_role = "arn:aws:iam::${var.aws_account}:role/OrganizationAccountAccessRole"
}
