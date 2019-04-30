variable "gcs_bucket_name" {
  type        = "string"
  description = "The name of the bucket"
}

variable "gcs_bucket_location" {
  type        = "string"
  default     = "europe-west2"
  description = "The geographical location the bucket is provisioned in. e.g. europe-west2"
}

variable "project_id" {
  type        = "string"
  description = "The ID of the project in which the resource belongs"
}

variable "gcs_bucket_storage_class" {
  type        = "string"
  default     = "REGIONAL"
  description = "The avaialability of the bucket. e.g MULTI-REGIONAL, REGIONAL, NEARLINE and COLDLINE"
}

variable "gcs_bucket_labels" {
  type        = "map"
  default     = {}
  description = "A set of key/value label pairs to assign to the bucket"
}

variable "versioning_enabled" {
  type        = "string"
  default     = true
  description = "While set to true, versioning is fully enabled for this bucket"
}

variable "enable_acl" {
  type        = "string"
  default     = true
  description = "Manages the access control list (ACL) for an object in a Google Cloud Storage (GCS) bucket"
}

variable "role_entity" {
  type        = "list"
  description = "List of role/entity pairs in the form ROLE:entity"
  default     = []
}
