output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_location" {
  description = "Location of the cluster"
  value       = google_container_cluster.primary.location
}

output "endpoint" {
  description = "Endpoint for the GKE cluster master"
  value       = google_container_cluster.primary.endpoint
}

output "master_version" {
  description = "Current master version"
  value       = google_container_cluster.primary.master_version
}

output "kubeconfig_command" {
  description = "Command to configure kubectl"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --region ${var.region} --project ${var.project_id}"
}

output "network" {
  description = "Network used by the cluster"
  value       = google_container_cluster.primary.network
}

output "subnetwork" {
  description = "Subnetwork used by the cluster"
  value       = google_container_cluster.primary.subnetwork
}

output "node_locations" {
  description = "Node locations in the cluster"
  value       = google_container_cluster.primary.node_locations
}
output "node_pool_name" {
  description = "Name of the primary node pool"
  value       = google_container_node_pool.node_pool_1.name
}

output "node_pool_id" {
  description = "ID of the primary node pool"
  value       = google_container_node_pool.node_pool_1.id
}

output "cluster_id" {
  description = "ID of the GKE cluster"
  value       = google_container_cluster.primary.id
}

output "workload_pool" {
  description = "Workload Identity Pool for the cluster"
  value       = google_container_cluster.primary.workload_identity_config[0].workload_pool
}

output "node_pool_version" {
  description = "Version of the primary node pool"
  value       = google_container_node_pool.node_pool_1.version
}

# Additional cluster details based on current configuration
output "release_channel" {
  description = "Release channel used by the cluster"
  value       = google_container_cluster.primary.release_channel[0].channel
}

output "datapath_provider" {
  description = "Datapath provider configured for the cluster"
  value       = google_container_cluster.primary.datapath_provider
}

output "default_max_pods_per_node" {
  description = "Default maximum number of pods per node"
  value       = google_container_cluster.primary.default_max_pods_per_node
}

output "logging_service_configured" {
  description = "Logging service configured for the cluster"
  value       = google_container_cluster.primary.logging_service
}

output "monitoring_service_configured" {
  description = "Monitoring service configured for the cluster"
  value       = google_container_cluster.primary.monitoring_service
}

output "binary_authorization_mode" {
  description = "Binary Authorization evaluation mode"
  value       = google_container_cluster.primary.binary_authorization[0].evaluation_mode
}

output "addon_http_load_balancing_enabled" {
  description = "Whether HTTP Load Balancing addon is enabled"
  value       = !google_container_cluster.primary.addons_config[0].http_load_balancing[0].disabled
}

output "addon_horizontal_pod_autoscaling_enabled" {
  description = "Whether Horizontal Pod Autoscaling addon is enabled"
  value       = !google_container_cluster.primary.addons_config[0].horizontal_pod_autoscaling[0].disabled
}

output "addon_gce_pd_csi_driver_enabled" {
  description = "Whether GCE PD CSI driver addon is enabled"
  value       = google_container_cluster.primary.addons_config[0].gce_persistent_disk_csi_driver_config[0].enabled
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate (decoded)"
  value       = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  sensitive   = true
}

# Node pool configuration details
output "node_pool_node_count" {
  description = "Configured node count for the primary node pool"
  value       = google_container_node_pool.node_pool_1.node_count
}

output "node_pool_autoscaling_min" {
  description = "Minimum nodes for autoscaling in the primary node pool"
  value       = google_container_node_pool.node_pool_1.autoscaling[0].min_node_count
}

output "node_pool_autoscaling_max" {
  description = "Maximum nodes for autoscaling in the primary node pool"
  value       = google_container_node_pool.node_pool_1.autoscaling[0].max_node_count
}

output "node_machine_type" {
  description = "Machine type used by nodes"
  value       = google_container_node_pool.node_pool_1.node_config[0].machine_type
}

output "node_image_type" {
  description = "Image type used by nodes"
  value       = google_container_node_pool.node_pool_1.node_config[0].image_type
}

output "node_disk_type" {
  description = "Disk type used by nodes"
  value       = google_container_node_pool.node_pool_1.node_config[0].disk_type
}

output "node_disk_size_gb" {
  description = "Disk size (GB) used by nodes"
  value       = google_container_node_pool.node_pool_1.node_config[0].disk_size_gb
}

output "node_spot" {
  description = "Whether nodes are Spot VMs"
  value       = google_container_node_pool.node_pool_1.node_config[0].spot
}

output "min_master_version_configured" {
  description = "Minimum master version configured on the cluster"
  value       = google_container_cluster.primary.min_master_version
}

output "workload_identity_pool" {
  description = "Alias for Workload Identity Pool for the cluster"
  value       = google_container_cluster.primary.workload_identity_config[0].workload_pool
}