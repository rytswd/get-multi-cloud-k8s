module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "12.2.0"

  cluster_name    = var.aws_cluster_name
  cluster_version = var.aws_cluster_version
  vpc_id          = var.aws_vpc
  subnets         = var.aws_subnets

  node_groups = {
    medium_nodes = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.medium"
      #   k8s_labels = {
      #     Environment = "test"
      #     GithubRepo  = "terraform-aws-eks"
      #     GithubOrg   = "terraform-aws-modules"
      #   }
      #   additional_tags = {
      #     ExtraTag = "example"
      #   }
    }
  }
}
