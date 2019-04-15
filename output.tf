output "gcs_bucket_url" {
  value = "${google_storage_bucket.image_store.url}"
}

output "gcs_bucket_uri" {
  value = "${google_storage_bucket.image_store.self_link}"
}
