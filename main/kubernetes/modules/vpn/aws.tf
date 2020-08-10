resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id          = var.aws_vpc
  amazon_side_asn = var.aws_bgp_asn
}

resource "aws_customer_gateway" "customer_gateway_1" {
  type       = "ipsec.1"
  bgp_asn    = google_compute_router.main.bgp[0].asn
  ip_address = google_compute_ha_vpn_gateway.target_gateway.vpn_interfaces[0].ip_address
}

resource "aws_customer_gateway" "customer_gateway_2" {
  type       = "ipsec.1"
  bgp_asn    = google_compute_router.main.bgp[0].asn
  ip_address = google_compute_ha_vpn_gateway.target_gateway.vpn_interfaces[1].ip_address
}

resource "aws_vpn_connection" "cx_1" {
  type                  = "ipsec.1"
  vpn_gateway_id        = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id   = aws_customer_gateway.customer_gateway_1.id
  tunnel1_inside_cidr   = cidrsubnet(var.vpn_cidr_base, 4, 1)
  tunnel1_preshared_key = var.preshared_key
  tunnel2_inside_cidr   = cidrsubnet(var.vpn_cidr_base, 4, 2)
  tunnel2_preshared_key = var.preshared_key
}

resource "aws_vpn_connection" "cx_2" {
  type                  = "ipsec.1"
  vpn_gateway_id        = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id   = aws_customer_gateway.customer_gateway_2.id
  tunnel1_inside_cidr   = cidrsubnet(var.vpn_cidr_base, 4, 3)
  tunnel1_preshared_key = var.preshared_key
  tunnel2_inside_cidr   = cidrsubnet(var.vpn_cidr_base, 4, 4)
  tunnel2_preshared_key = var.preshared_key
}


# For any static table routing

# resource "aws_route_table" "main" {
#   vpc_id = var.aws_vpc

#   propagating_vgws = [aws_vpn_gateway.vpn_gateway.id]

#   # route {
#   #   cidr_block = "35.199.192.0/19"
#   #   gateway_id = "${aws_vpn_gateway.vpn_gateway.id}"
#   # }

#   #   route {
#   #     cidr_block = "0.0.0.0/0"
#   #     gateway_id = aws_internet_gateway.gw.id
#   #   }
# }

# resource "aws_route_table_association" "main" {
#   count = 3

#   subnet_id      = element(var.aws_subnets, count.index)
#   route_table_id = aws_route_table.main.id
# }
