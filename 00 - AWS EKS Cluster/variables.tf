variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use for credentials"
  type        = string
  default     = "default"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "kplabs-k8s-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.31"
}

variable "node_desired_capacity" {
  type    = number
  default = 1
}

variable "node_min_capacity" {
  type    = number
  default = 1
}

variable "node_max_capacity" {
  type    = number
  default = 1
}

variable "node_instance_types" {
  type    = list(string)
  # Use a small/micro size by default to limit cost. Change if needed.
  default = ["t3.micro"]
}

variable "ssh_key_name" {
  description = "SSH key name to attach to worker nodes (optional)"
  type        = string
  default     = ""
}

variable "node_capacity_type" {
  description = "Capacity type for node group: ON_DEMAND or SPOT"
  type        = string
  default     = "SPOT"
}

variable "single_nat_gateway" {
  description = "Create a single NAT gateway to reduce costs"
  type        = bool
  default     = true
}

# -------- VPC variables --------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs (one per AZ)"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs (one per AZ)"
  type        = list(string)
  default     = ["10.10.10.0/24", "10.10.11.0/24", "10.10.12.0/24"]
}
