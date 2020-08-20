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

