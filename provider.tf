terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

# ---------------------------------------
# Google Provider
# ---------------------------------------
provider "google" {
  project = var.project_id
  region  = var.region
}


# Fetch cluster details dynamically (always up-to-date)
data "google_container_cluster" "autopilot_cluster" {
  name     = "rtc-dev-sit-autopilot"
  location = var.region
  project  = var.project_id
}

# Fetch access token from current credentials
data "google_client_config" "default" {}

provider "kubernetes" {
  alias = "gke"

  host                   = try("https://${data.google_container_cluster.autopilot_cluster.endpoint}", "")
  token                  = try(data.google_client_config.default.access_token, "")
  cluster_ca_certificate = try(base64decode(data.google_container_cluster.autopilot_cluster.master_auth[0].cluster_ca_certificate), "")
}
