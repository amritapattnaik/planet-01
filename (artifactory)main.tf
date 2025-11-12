# Terraform module to create Artifact Registry repositories

resource "google_artifact_registry_repository" "artifact_repository" {
  project       = var.project_id
  for_each      = toset(var.repository_name)
  repository_id = each.key
  location      = var.location_artifact
  format        = var.repository_format
  description   = var.repository_description

  labels = {
    environment = var.environment
    created_by  = var.created_by
    managed_by  = var.managed_by
    project     = var.project_label
    team        = var.team
  }
}

