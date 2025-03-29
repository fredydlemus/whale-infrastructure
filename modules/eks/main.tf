module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.34.0"

  cluster_name    = var.cluster_name
  cluster_version = var.eks_version

  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true #Change to managed node groups in the future
    node_pools = ["general-purpose"]
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnets

  tags = var.tags
}

