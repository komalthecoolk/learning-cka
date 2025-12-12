# EKS Cluster (minimal-cost)

This Terraform configuration creates a basic EKS cluster configured to minimize cost.
VPC and EKS are separated into different files so you can **retain the VPC** while destroying EKS resources when not in use.

## File structure

| File | Purpose |
|------|---------|
| `vpc.tf` | VPC, subnets, NAT gateway — retain after EKS destroy |
| `eks.tf` | EKS cluster and managed node group — destroy independently |
| `variables.tf` | Input variables (region, instance types, CIDRs, etc.) |
| `outputs.tf` | Outputs for VPC IDs, subnets, and EKS details |
| `providers.tf` | AWS provider configuration |
| `versions.tf` | Terraform and provider version constraints |

## Quick commands

```bash
cd "learning-cka/00 - AWS EKS Cluster"
terraform init
terraform plan
terraform apply
```

> By default, the `default` AWS profile and `us-east-1` region are used. Override with `-var`:
> ```bash
> terraform apply -var='aws_profile=myprofile' -var='aws_region=eu-west-1'
> ```

## Destroy only EKS (keep VPC)

```bash
terraform destroy -target=module.eks
```

This removes the EKS cluster and node group but keeps the VPC, subnets, and NAT gateway so you can recreate EKS quickly without reprovisioning networking.

## Recreate EKS (reusing existing VPC)

```bash
terraform apply
```

Terraform will detect that the VPC already exists and only create the EKS resources.

## Destroy everything

```bash
terraform destroy
```

## Cost-saving notes

- **Instance type**: defaults to `t3.micro` (change via `node_instance_types`).
- **Spot instances**: `node_capacity_type = "SPOT"` by default — significantly cheaper but can be reclaimed.
- **Single NAT gateway**: `single_nat_gateway = true` reduces NAT costs (one gateway instead of one per AZ).
- **EKS control plane**: has a baseline hourly cost (~$0.10/hr) even with zero worker nodes — destroy the cluster when idle.
- **VPC**: keeping the VPC alone incurs minimal cost (NAT gateway charges only when traffic flows); destroy it too if you want zero cost.

## AWS credentials

Uses the `default` AWS CLI profile. Ensure credentials exist in `~/.aws/credentials` or set environment variables, or override with:

```bash
terraform apply -var='aws_profile=<profile>'
```

## Outputs

After `terraform apply`, useful outputs include:

| Output | Description |
|--------|-------------|
| `vpc_id` | VPC ID |
| `private_subnets` | Private subnet IDs used by EKS |
| `public_subnets` | Public subnet IDs |
| `cluster_name` | EKS cluster name |
| `cluster_endpoint` | EKS API server endpoint |

## Configure kubectl

```bash
aws eks update-kubeconfig --name $(terraform output -raw cluster_name) --region us-east-1
kubectl get nodes
```