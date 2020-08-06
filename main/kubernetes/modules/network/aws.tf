provider "aws" {
  version = "~> 2.16"
  region  = var.aws_region
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "multi_cloud_aws" {
  cidr_block = var.aws_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "multi_cloud_aws" {
  count = 3

  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 3, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  vpc_id            = aws_vpc.main.id
}
