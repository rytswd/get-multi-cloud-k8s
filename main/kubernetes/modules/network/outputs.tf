output "aws_vpc" {
  value = aws_vpc.multi_cloud_aws.id
}

output "aws_subnets" {
  value = aws_subnet.multi_cloud_aws.*.id
}

output "gcp_vpc" {
  value = google_compute_network.multi_cloud_gcp.self_link
}
