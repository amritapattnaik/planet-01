variable "project_id" {
  description = "gcp project"
}

variable "region" {
  type        = string
  description = "default gcp region"
 }

variable "create_namespaces" {
  type        = bool
  default     = true
  description = "Whether to create namespaces or not"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "namespaces" {
  description = "List of namespace names"
  type        = list(string)
}

variable "create_gke_cluster" {
  description = "Flag to indicate whether the GKE cluster is being created"
  type        = bool
}
