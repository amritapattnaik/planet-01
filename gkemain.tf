terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

# Fetch current GCP credentials info for generating access tokens
data "google_client_config" "default" {}

resource "google_container_cluster" "autopilot_cluster" {
  name                 = var.cluster_name
  project              = var.project_id
  location             = var.region
  network              = var.network
  subnetwork           = var.subnetwork
  enable_autopilot     = true
  deletion_protection  = var.deletion_protection

  vertical_pod_autoscaling {
    enabled = true
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }

  node_pool_auto_config {
    network_tags {
      tags = [var.region]
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  release_channel {
    channel = var.release_channel
  }

master_authorized_networks_config {
  dynamic "cidr_blocks" {
    for_each = var.master_authorized_networks
    content {
      display_name = cidr_blocks.value.display_name
      cidr_block   = cidr_blocks.value.cidr_block
    }
  }

  # Allow public CIDRs access if enabled
  dynamic "cidr_blocks" {
    for_each = var.gcp_public_cidrs_access_enabled ? [
      {
        display_name = "Google Cloud Public Access"
        cidr_block   = "0.0.0.0/0"
      }
    ] : []
    content {
      display_name = cidr_blocks.value.display_name
      cidr_block   = cidr_blocks.value.cidr_block
    }
  }
}


  # Logging and Monitoring configuration
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  # Labels
  resource_labels = {
    environment = var.environment
    created_by  = replace(var.created_by, ".", "-")
    managed_by  = var.managed_by
    project     = var.project_label
    team        = var.team
  }

#  lifecycle {
#    ignore_changes = [
#      node_config,
#      node_pool_auto_config,
#      ip_allocation_policy,
#      resource_labels
#    ]
#  }
}
