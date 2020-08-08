provider "google-beta" {
  alias = "vpn"
}

resource "google_compute_router" "main" {
  name    = "router-main"
  network = var.gcp_vpc

  bgp {
    asn = var.gcp_bgp_asn
    # advertise_mode    = "CUSTOM"
    # advertised_groups = ["ALL_SUBNETS"]

    # advertised_ip_ranges {
    #   range = "35.199.192.0/19"
    #   description = "Cloud DNS Managed Private Zone Forwarding"
    # }
  }
}

resource "google_compute_ha_vpn_gateway" "target_gateway" {
  provider = "google-beta.vpn"
  name     = "vpn-to-aws"
  network  = var.gcp_vpc
}


# resource "google_compute_external_vpn_gateway" "aws_gateway" {
#   provider        = "google-beta.vpn"
#   name            = "aws-gateway"
#   redundancy_type = "FOUR_IPS_REDUNDANCY"
#   description     = "VPN gateway on AWS side"

#   interface {
#     id         = 0
#     ip_address = aws_vpn_connection.cx_1.tunnel1_address
#   }

#   interface {
#     id         = 1
#     ip_address = aws_vpn_connection.cx_1.tunnel2_address
#   }

#   interface {
#     id         = 2
#     ip_address = aws_vpn_connection.cx_2.tunnel1_address
#   }

#   interface {
#     id         = 3
#     ip_address = aws_vpn_connection.cx_2.tunnel2_address
#   }
# }

# resource "google_compute_vpn_tunnel" "gcp_to_aws1" {
#   provider                        = "google-beta.vpn"
#   name                            = "vpn-tunnel-to-aws-ha1"
#   vpn_gateway                     = google_compute_ha_vpn_gateway.target_gateway.self_link
#   shared_secret                   = aws_vpn_connection.cx_1.tunnel1_preshared_key
#   peer_external_gateway           = google_compute_external_vpn_gateway.aws_gateway.self_link
#   peer_external_gateway_interface = 0
#   router                          = google_compute_router.main.name
#   ike_version                     = 2
#   vpn_gateway_interface           = 0
# }

# resource "google_compute_vpn_tunnel" "gcp_to_aws2" {
#   provider                        = "google-beta.vpn"
#   name                            = "vpn-tunnel-to-aws-ha2"
#   vpn_gateway                     = google_compute_ha_vpn_gateway.target_gateway.self_link
#   shared_secret                   = aws_vpn_connection.cx_1.tunnel2_preshared_key
#   peer_external_gateway           = google_compute_external_vpn_gateway.aws_gateway.self_link
#   peer_external_gateway_interface = 1
#   router                          = google_compute_router.main.name
#   ike_version                     = 2
#   vpn_gateway_interface           = 0
# }

# resource "google_compute_vpn_tunnel" "gcp_to_aws3" {
#   provider                        = "google-beta.vpn"
#   name                            = "vpn-tunnel-to-aws-ha3"
#   vpn_gateway                     = google_compute_ha_vpn_gateway.target_gateway.self_link
#   shared_secret                   = aws_vpn_connection.cx_2.tunnel1_preshared_key
#   peer_external_gateway           = google_compute_external_vpn_gateway.aws_gateway.self_link
#   peer_external_gateway_interface = 2
#   router                          = google_compute_router.main.name
#   ike_version                     = 2
#   vpn_gateway_interface           = 1
# }

# resource "google_compute_vpn_tunnel" "gcp_to_aws4" {
#   provider                        = "google-beta.vpn"
#   name                            = "vpn-tunnel-to-aws-ha4"
#   vpn_gateway                     = google_compute_ha_vpn_gateway.target_gateway.self_link
#   shared_secret                   = aws_vpn_connection.cx_2.tunnel2_preshared_key
#   peer_external_gateway           = google_compute_external_vpn_gateway.aws_gateway.self_link
#   peer_external_gateway_interface = 3
#   router                          = google_compute_router.main.name
#   ike_version                     = 2
#   vpn_gateway_interface           = 1
# }

# resource "google_compute_router_interface" "gcp_to_aws1" {
#   name       = "interface-to-aws-ha1"
#   router     = google_compute_router.main.name
#   ip_range   = "${aws_vpn_connection.cx_1.tunnel1_cgw_inside_address}/30"
#   vpn_tunnel = google_compute_vpn_tunnel.gcp_to_aws1.name
# }

# resource "google_compute_router_interface" "gcp_to_aws2" {
#   name       = "interface-to-aws-ha2"
#   router     = google_compute_router.main.name
#   ip_range   = "${aws_vpn_connection.cx_1.tunnel2_cgw_inside_address}/30"
#   vpn_tunnel = google_compute_vpn_tunnel.gcp_to_aws2.name
# }

# resource "google_compute_router_interface" "gcp_to_aws3" {
#   name       = "interface-to-aws-ha3"
#   router     = google_compute_router.main.name
#   ip_range   = "${aws_vpn_connection.cx_2.tunnel1_cgw_inside_address}/30"
#   vpn_tunnel = google_compute_vpn_tunnel.gcp_to_aws3.name
# }

# resource "google_compute_router_interface" "gcp_to_aws4" {
#   name       = "interface-to-aws-ha4"
#   router     = google_compute_router.main.name
#   ip_range   = "${aws_vpn_connection.cx_2.tunnel2_cgw_inside_address}/30"
#   vpn_tunnel = google_compute_vpn_tunnel.gcp_to_aws4.name
# }

# resource "google_compute_router_peer" "gcp_to_aws1" {
#   name                      = "peer-aws1"
#   router                    = google_compute_router.main.name
#   peer_ip_address           = aws_vpn_connection.cx_1.tunnel1_vgw_inside_address
#   peer_asn                  = aws_vpn_connection.cx_1.tunnel1_bgp_asn
#   advertised_route_priority = 100
#   interface                 = google_compute_router_interface.gcp_to_aws1.name
# }

# resource "google_compute_router_peer" "gcp_to_aws2" {
#   name                      = "peer-aws2"
#   router                    = google_compute_router.main.name
#   peer_ip_address           = aws_vpn_connection.cx_1.tunnel2_vgw_inside_address
#   peer_asn                  = aws_vpn_connection.cx_1.tunnel2_bgp_asn
#   advertised_route_priority = 100
#   interface                 = google_compute_router_interface.gcp_to_aws2.name
# }

# resource "google_compute_router_peer" "gcp_to_aws3" {
#   name                      = "peer-aws3"
#   router                    = google_compute_router.main.name
#   peer_ip_address           = aws_vpn_connection.cx_2.tunnel1_vgw_inside_address
#   peer_asn                  = aws_vpn_connection.cx_2.tunnel1_bgp_asn
#   advertised_route_priority = 100
#   interface                 = google_compute_router_interface.gcp_to_aws3.name
# }

# resource "google_compute_router_peer" "gcp_to_aws4" {
#   name                      = "peer-aws4"
#   router                    = google_compute_router.main.name
#   peer_ip_address           = aws_vpn_connection.cx_2.tunnel2_vgw_inside_address
#   peer_asn                  = aws_vpn_connection.cx_2.tunnel2_bgp_asn
#   advertised_route_priority = 100
#   interface                 = google_compute_router_interface.gcp_to_aws4.name
# }

