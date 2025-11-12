# ------- Common Variables -------

variable "project_id" {
    description         = "The GCP project ID to create the artifact repository"
    type                = string
}

variable "region" {
    description         = "The GCP region/location to create the artifact repository"
    type                = string
}

variable "location" {
    description         = "The GCP region/location to create the resources"
    type                = string
}

variable "environment" {
  description = "The deployment is environment"
  type        = string
}

variable "created_by" {
  description = "Tag to identify who created the resource"
  type        = string
}

variable "project_label" {
  description = "Project name label"
  type        = string
}

variable "team" {
  description = "Team for tagging GCP resources"
  type        = string
}


# ------- Artifact Registry Variables -------

variable "create_registry" {
  description           = "Boolean to control whether registry cluster should be created"
  type                  = bool
}

variable "repository_name" {
  description           = "The name of the artifact registry repository"
  type                  = list(string)
}

variable "location_artifact" {
  description           = "The location ID of the redis instance"
  type                  = string
}

variable "repository_format" {
  description           = "The format of the repository"
  type                  = string
}

variable "repository_description" {
  description           = "The description of the repository"
  type                  = string
}


# ------- GCP Bucket Variables -------

variable "create_bucket" {
  description           = "Boolean to control whether bucket should be created"
  type                  = bool
  default               = true
}
 
variable "bucket_name" {
  description           = "The name of the bucket"
  type                  = string
}
 
variable "bucket_location" {
  description           = "The location for the bucket"
  type                  = string
  default               = "US"
}
 
variable "bucket_storage_class" {
  description           = "The storage class of the bucket"
  type                  = string
  default               = "STANDARD"
}

variable "aide_id" {
  description = "AIDE identifier for this resource"
  type        = string
}

variable "service_tier" {
  description = "Service tier for classification (p1, p2, p3)"
  type        = string
}

variable "managed_by" {
  description = "Managed by for tagging GCP resources"
  type        = string
}


# ------- GKE Autopilot Cluster Variables -------

variable "create_gke_cluster" {
  description = "Boolean to control whether to create the GKE cluster"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "The GKE cluster name"
  type        = string
}

variable "cluster_region" {
  description = "The GCP region where the cluster will be created"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
}

variable "secondary_range_name" {
  description = "Secondary range name for pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "The secondary range name for cluster services"
  type        = string
}

variable "release_channel" {
  description = "The GKE release channel"
  type        = string
  default     = "REGULAR"
}

variable "deletion_protection" {
  description = "Enable or disable deletion protection"
  type        = bool
  default     = false
}

variable "master_authorized_networks" {
  description = "List of authorized networks for accessing the GKE master endpoint"
  type = list(object({
    display_name = string
    cidr_block   = string
  }))
}

variable "gcp_public_cidrs_access_enabled" {
  description = "Allow public CIDR access to GKE master endpoint (needed for Terraform or CI/CD)"
  type        = bool
  default     = false
}

# ------- Kubernetes Namespace Variables -------

variable "create_namespaces" {
  description = "Whether to create namespaces in GKE"
  type        = bool
  default     = true
}

variable "namespace_names" {
  description = "List of namespaces to create in GKE"
  type        = list(string)
  default     = []
}

variable "namespaces" {
  description = "List of namespace names"
  type        = list(string)
}
