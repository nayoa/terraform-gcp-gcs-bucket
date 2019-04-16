provider "google" {}

resource "google_storage_bucket" "image_store" {
  name          = "${var.gcs_bucket_name}"
  location      = "${var.gcs_bucket_location}"
  project       = "${var.project_id}"
  storage_class = "${var.gcs_bucket_storage_class}"

  labels = "${var.gcs_bucket_labels}"

  versioning {
    enabled = "${var.versioning_enabled}"
  }
}
