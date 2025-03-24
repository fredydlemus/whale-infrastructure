module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.34.0"

    cluster_name = var.cluster_name
    cluster_version = var.eks_version
    subnet_ids = var.subnets
    vpc_id = var.vpc_id

    authentication_mode = "API_AND_CONFIG_MAP"
    enable_cluster_creator_admin_permissions = true

    tags = var.tags
}

module "eks_managed_node_group" {
    source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
    version = "20.34.0"

    cluster_name = module.eks.cluster_name

    node_group_name = "eks_nodes"
    node_group_defaults = {
        ami_type = "AL2_x86_64"
        instance_types = [var.node_instance_type]
    }

    subnet_ids = var.subnets

    scaling_config = {
        desired_size = var.node_desired_capacity
        min_size = var.node_min_capacity
        max_size = var.node_max_capacity
    }

    remote_access = {
        ec2_ssh_key = var.ec2_key_pair
    }

    tags = var.tags
}