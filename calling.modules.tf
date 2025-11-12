# ============================================================
# Artifact Registry Module
# ============================================================
module "registry" {
  source = "./modules/artifact_registry"
  count  = var.create_registry ? 1 : 0

  project_id             = var.project_id
  location_artifact      = var.location_artifact
  repository_name        = var.repository_name
  repository_format      = var.repository_format
  repository_description = var.repository_description

  # Labels
  environment            = var.environment
  created_by             = var.created_by
  project_label          = var.project_label
  team                   = var.team
  managed_by             = var.managed_by
}


module "gcs_bucket" {
  source        = "./modules/gcs_bucket"
  count         = var.create_bucket ? 1 : 0

  bucket_name   = var.bucket_name
  location      = var.bucket_location
  storage_class = var.bucket_storage_class

  # Labels
  environment   = var.environment
  aide_id       = var.aide_id
  service_tier  = var.service_tier
  created_by    = var.created_by
  project_label = var.project_label
  managed_by    = var.managed_by
}


module "gke_autopilot" {
  source = "./modules/gke_autopilot"
  count  = var.create_gke_cluster ? 1 : 0

  project_id                      = var.project_id
  cluster_name                    = var.cluster_name
  region                          = var.cluster_region
  network                         = var.network
  subnetwork                      = var.subnetwork
  secondary_range_name            = var.secondary_range_name
  services_secondary_range_name   = var.services_secondary_range_name
  release_channel                 = var.release_channel
  deletion_protection             = var.deletion_protection
  master_authorized_networks      = var.master_authorized_networks
  gcp_public_cidrs_access_enabled = var.gcp_public_cidrs_access_enabled

  # Labels
  environment   = var.environment
  created_by    = var.created_by
  project_label = var.project_label
  team          = var.team
  managed_by    = var.managed_by

  # Dependency: Cluster creation should wait for Artifact Registry and GCS bucket
  depends_on = [
    module.registry
  ]
}


module "namespaces" {
  source              = "./modules/namespace"
  create_namespaces   = var.create_namespaces

  project_id          = var.project_id
  region              = var.region
  cluster_name        = var.cluster_name
  namespaces          = var.namespaces
  create_gke_cluster  = var.create_gke_cluster

  providers = {
    kubernetes = kubernetes.gke
  }

  # Dependency: Namespaces should be created only after GKE cluster is up
  depends_on = [
    module.gke_autopilot
  ]
}

resource "null_resource" "delete_ns" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      echo "Deleting namespaces manually before GKE destroy..."
      kubectl delete namespace rtc-gcp-dev1 rtc-gcp-sit --ignore-not-found=true --wait=false || true
      echo "Waiting for namespaces to terminate..."
      for ns in rtc-gcp-dev1 rtc-gcp-sit; do
        kubectl wait --for=delete namespace/$ns --timeout=300s || true
      done
    EOT
  }

  depends_on = [module.namespaces]
}
