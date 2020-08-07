locals {
  billing_account = "XXXXXX-XXXXXX-XXXXXX"
  org_id          = "123456789012"

  gcp_admin_project   = "upsidr-terraform-admin"
  defalut_gcp_regions = "europe-west2"
}

variable "gcp_project" {
  default = "rytswd-get-multi-cloud-k8s-v01"
}
