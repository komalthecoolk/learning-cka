output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "endpoint" {
  description = "Endpoint for the GKE cluster master"
  value       = google_container_cluster.primary.endpoint
}

output "master_version" {
  description = "Kubernetes master version"
  value       = google_container_cluster.primary.initial_cluster_version
}

output "kubeconfig_command" {
  description = "Command to configure kubectl credentials"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --zone ${var.zone} --project ${var.project_id}"
}
