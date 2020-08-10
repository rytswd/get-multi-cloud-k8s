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

variable "aws_account" {
  description = "AWS Account ID in 12 digit representation."
  default     = "953930786689"
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

#* ---------------------------------------------------------------------------- *#
#     Computed values below
#* ---------------------------------------------------------------------------- *#

locals {
  # Given Terraform IAM account is created at root account, it can assume a
  # role called "OrganizationAccountAccessRole", which is automatically created
  # in a new AWS account.
  aws_account_role = "arn:aws:iam::${var.aws_account}:role/OrganizationAccountAccessRole"
}
