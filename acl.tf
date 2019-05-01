resource "google_storage_bucket_acl" "image-store-acl" {
  count  = "${var.enable_acl}"
  bucket = "${google_storage_bucket.image_store.name}"

  role_entity = [
    "${var.role_entity}",
  ]
}
