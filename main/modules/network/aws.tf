/* ----------------------------------------------------------------------------
    AWS
------------------------------------------------------------------------------- */
provider "aws" {
  version = "~> 2.16"
  region  = var.aws_region
}

/* ----------------------------------------------------------------------------
    Variables
------------------------------------------------------------------------------- */
variable "aws_region" {}

variable "aws_cidr" {}

data "aws_availability_zones" "available" {}

/* ----------------------------------------------------------------------------
    Resources
------------------------------------------------------------------------------- */
resource "aws_vpc" "main" {
  cidr_block = var.aws_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "main" {
  count = 3

  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 3, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  vpc_id            = aws_vpc.main.id
}
