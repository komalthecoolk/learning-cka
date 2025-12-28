/*
  VPC and EKS configurations have been split into separate files:
    - vpc.tf   : VPC, subnets, NAT gateway (retain after destroy)
    - eks.tf   : EKS cluster and managed node group (destroyable independently)
*/
