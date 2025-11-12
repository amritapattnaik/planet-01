output "cluster_name" {
  description = "GKE cluster name (null if cluster lookup disabled or not found)"
  value       = try(data.google_container_cluster.autopilot_cluster[0].name, null)
}

output "cluster_location" {
  description = "GKE cluster location (null if cluster lookup disabled or not found)"
  value       = try(data.google_container_cluster.autopilot_cluster[0].location, null)
}

output "namespaces" {
  description = "List of namespaces created"
  value       = [for namespace in kubernetes_namespace.namespace : namespace.metadata[0].name]
}
