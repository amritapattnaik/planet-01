variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "location" {
  description = "The location of the bucket"
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD"
}

variable "environment" {
  description = "Environment label value (e.g., dev/test/prod)"
  type        = string
}

variable "aide_id" {
  description = "Unique AIDE ID for internal identification"
  type        = string
}

variable "service_tier" {
  description = "Service tier of the bucket (e.g., p1/p2/p3)"
  type        = string
}

variable "created_by" {
  description = "Creator identifier for labeling (no dots allowed)"
  type        = string
}

variable "project_label" {
  description = "Project name label"
  type        = string
}

variable "managed_by" {
  description = "Managed by for tagging GCP resources"
  type        = string
}
