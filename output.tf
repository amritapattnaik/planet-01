# =====================================================
# Outputs for Artifact Registry Module
# =====================================================

output "artifact_registry_names" {
  description = "List of created Artifact Registry repository names"
  value = (
    var.create_registry && length(module.registry) > 0 ?
    module.registry[0].registry_names :
    []
  )
}

# =====================================================
# Outputs for GCS Bucket Module
# =====================================================

output "gcs_bucket_name" {
  description = "The name of the created GCS bucket"
  value = (
    var.create_bucket && length(module.gcs_bucket) > 0 ?
    module.gcs_bucket[0].bucket_name :
    null
  )
}

output "gcs_bucket_url" {
  description = "Console URL for viewing the bucket"
  value = (
    var.create_bucket && length(module.gcs_bucket) > 0 ?
    module.gcs_bucket[0].bucket_url :
    null
  )
}


# =====================================================
# Outputs for GKE Autopilot Cluster
# =====================================================

output "gke_cluster_name" {
  description = "The name of the created GKE Autopilot cluster"
  value = (
    var.create_gke_cluster && length(module.gke_autopilot) > 0 ?
    module.gke_autopilot[0].cluster_name :
    null
  )
}

output "gke_cluster_endpoint" {
  description = "The GKE cluster endpoint URL"
  value = (
    var.create_gke_cluster && length(module.gke_autopilot) > 0 ?
    module.gke_autopilot[0].cluster_endpoint :
    null
  )
}


# =====================================================
# Outputs for Namespace Module
# =====================================================
