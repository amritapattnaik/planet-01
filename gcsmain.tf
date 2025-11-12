resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  # Merge static and dynamic labels, sanitize invalid chars
  labels = {
    aide_id       = replace(var.aide_id, ".", "-")
    environment   = var.environment
    service_tier  = var.service_tier
    created_by    = replace(var.created_by, ".", "-")
    managed_by    = var.managed_by
    project       = var.project_label
  }
}
