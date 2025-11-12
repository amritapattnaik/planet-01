variable "project_id" {
  description = "The GCP project ID where the cluster will be created"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE Autopilot cluster"
  type        = string
}

variable "region" {
  description = "The region for the cluster (e.g. us-central1)"
  type        = string
}

variable "network" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork"
  type        = string
}

variable "secondary_range_name" {
  description = "The secondary range name for cluster pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "The secondary range name for cluster services"
  type        = string
}

variable "release_channel" {
  description = "The release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "deletion_protection" {
  description = "Enable or disable deletion protection"
  type        = bool
  default     = false
}

variable "gcp_public_cidrs_access_enabled" {
  description = "Allow public CIDR access to GKE master endpoint (needed for Terraform or CI/CD)"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment name (e.g., dev/test/prod/nonprod)"
  type        = string
}

variable "created_by" {
  description = "Name or ID of the resource creator (e.g., subodh-kumar)"
  type        = string
}

variable "project_label" {
  description = "Project label for tagging GCP resources"
  type        = string
}

variable "team" {
  description = "Team for tagging GCP resources"
  type        = string
}

variable "managed_by" {
  description = "Managed by for tagging GCP resources"
  type        = string
}

variable "master_authorized_networks" {
  description = "List of authorized CIDR blocks for accessing the master"
  type = list(object({
    display_name = string
    cidr_block   = string
  }))
  default = []
}
