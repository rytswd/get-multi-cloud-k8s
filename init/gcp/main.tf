provider "google" {
  project = "get-multi-cloud-k8s"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

resource "google_project" "get_multi_cloud_k8s_v01" {
  name            = "get-multi-cloud-k8s-v01"
  project_id      = "get-multi-cloud-k8s-v01"
  billing_account = local.billing_account
  org_id          = local.org_id
}
