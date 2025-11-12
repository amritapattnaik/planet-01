
output "cluster_name" {
  description = "The name of the GKE Autopilot cluster"
  value       = google_container_cluster.autopilot_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE Autopilot cluster"
  value       = google_container_cluster.autopilot_cluster.endpoint
}

output "cluster_location" {
  description = "Location (region) of the GKE cluster"
  value       = google_container_cluster.autopilot_cluster.location
}

output "cluster_labels" {
  description = "Labels assigned to the GKE cluster"
  value       = google_container_cluster.autopilot_cluster.resource_labels
}
