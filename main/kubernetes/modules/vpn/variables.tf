
variable "link_local_cidr_base" {
  description = "IP CIDR for VPN Tunnels. This must be a link-local IP (169.254.0.0/16), and for further processing, it needs to be /26."
}

variable "preshared_key" {
  description = "Preshared key for establishing IPSec connection. You can generate a sample key at: https://cloud.google.com/vpn/docs/how-to/generating-pre-shared-key"
}

variable "aws_region" {}
variable "aws_vpc" {}
variable "aws_subnets" {}
variable "aws_bgp_asn" {}

variable "gcp_region" {}
variable "gcp_vpc" {}
variable "gcp_bgp_asn" {}
