variable "project_id" {
  description = "The GCP project ID to create the artifact repository"
  type        = string
}

variable "location_artifact" {
  description = "The location for the Artifact Registry repository"
  type        = string
}

variable "repository_name" {
  description = "The list of artifact registry repository names"
  type        = list(string)
}

variable "repository_format" {
  description = "The format of the repository (e.g., DOCKER, MAVEN, NPM, etc.)"
  type        = string
}

variable "repository_description" {
  description = "The description of the repository"
  type        = string
}

# --- variables for labels and metadata ---
variable "environment" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "created_by" {
  description = "Name or identifier of the person/team creating the resource"
  type        = string
}

variable "project_label" {
  description = "Project name label for tagging"
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
