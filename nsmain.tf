terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
  }
}

data "google_client_config" "default" {}

# Only read the cluster if it's expected to exist
data "google_container_cluster" "autopilot_cluster" {
  count    = var.create_gke_cluster ? 1 : 0
  project  = var.project_id
  location = var.region
  name     = var.cluster_name
}

resource "kubernetes_namespace" "namespace" {
  for_each = var.create_namespaces ? toset(var.namespaces) : []
  provider = kubernetes
  
  metadata {
    name = each.key
  }

  lifecycle {
    #prevent_destroy = true
    ignore_changes  = [metadata]
  }
}
