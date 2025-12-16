variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "lab-cluster-single-node"
}

variable "machine_type" {
  description = "Machine type for the node"
  type        = string
  default     = "e2-small"
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 1
}
