######
# GCS
######

module "example_gcs_bucket" {
  source                   = ".."
  gcs_bucket_name          = "example-bucket-name-857684958394"
  gcs_bucket_location      = "europe-west1"
  project_id               = "personal-230312"
  gcs_bucket_storage_class = "REGIONAL"
  versioning_enabled       = false
  enable_acl               = true

  gcs_bucket_labels = {
    name        = "example_gcs_bucket"
    createdby   = "joebloggs"
    environment = "uat"
    managedby   = "product_team"
  }

  role_entity = [
    "OWNER:user-fakeemail@evesleep.co.uk",
    "WRITER:user-fakeemail@evesleep.co.uk",
    "READER:user-fakeemail@evesleep.co.uk",
  ]
}
