output "bucket_name" {
  description = "The name of the bucket"
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "The URL of the bucket"
  value       = "https://console.cloud.google.com/storage/browser/${google_storage_bucket.bucket.name}"
}

output "bucket_self_link" {
  description = "The self link of the bucket"
  value       = google_storage_bucket.bucket.self_link
}

output "bucket_labels" {
  description = "Labels assigned to the bucket"
  value       = google_storage_bucket.bucket.labels
}
