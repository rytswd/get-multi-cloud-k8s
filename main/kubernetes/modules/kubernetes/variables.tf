
variable "gcp_region" {}
variable "gcp_subnet" {}
variable "gcp_vpc" {}
variable "gcp_cluster_name" {}

variable "enable_n1_preemptible_pool" {
  default = false
}
variable "enable_e2_shared_preemptible_pool" {
  default = false
}

