/*
  EKS cluster using terraform-aws-modules/eks/aws
  References VPC created in vpc.tf. Destroy this file's resources independently.
*/

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  # Managed node group
  eks_managed_node_groups = {
    default = {
      desired_size   = var.node_desired_capacity
      min_size       = var.node_min_capacity
      max_size       = var.node_max_capacity
      instance_types = var.node_instance_types
      capacity_type  = var.node_capacity_type

      key_name = var.ssh_key_name != "" ? var.ssh_key_name : null
    }
  }

  tags = {
    "CreatedBy" = "terraform"
  }
}

/* Helpful data sources to reference cluster after creation */
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
