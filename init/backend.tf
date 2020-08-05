terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "rytswd"

    workspaces {
      name = "get-multi-cloud-k8s"
    }
  }
}
