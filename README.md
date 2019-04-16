# GCP Google Cloud Storage (GCS) Terraform Module

Terraform module that creates GCS buckets in GCP

These types of resources are supported:

* [Google Cloud Storage Bucket](https://www.terraform.io/docs/providers/google/r/storage_bucket.html)
* [Google Cloud Storage ACL](https://www.terraform.io/docs/providers/google/r/storage_bucket_acl.html)

## Dependencies

* [Google Cloud SDK (gcloud) >= 241.0.0](https://cloud.google.com/sdk/gcloud/)

```
# User Authentication

$ gcloud auth application-default login
Your browser has been opened to visit:

https://accounts.google.com/o/oauth2/auth?redirect_uri=http... (Follow instructions)

Credentials saved to file: [/Users/joebloggs/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests
Application Default Credentials.

To generate an access token for other uses, run:
gcloud auth application-default print-access-token

$ gcloud config list
[core]
account = joebloggs@gmail.com
disable_usage_reporting = True
project = joebloggs-project-238943

Your active configuration is: [default]

$ gcloud config set project <project-id>
```

* [Terraform >= v0.11.13](https://learn.hashicorp.com/terraform/getting-started/install.html)

**Note**:

* Google Cloud SDK is available [homebrew cask](https://github.com/Homebrew/homebrew-cask)

```bash
$ brew cask install google-cloud-sdk
```

* Terraform is available on [homebrew](https://brew.sh/)

```bash
$ brew install terraform
```

## Usage

```hcl
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
```

**Note**:

* Labels - Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. All characters must use UTF-8 encoding, and international characters are allowed.
* [Role Entities](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) - Depending on the entity value, the value is prefixed with it's type. e.g. user, group, domain and project.

## Examples

* [GCS Example](example/main.tf)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcs_bucket_name | The name of the bucket | string | - | yes |
| gcs_bucket_location | The geographical location the bucket is provisioned in | string | europe-west2 | no |
| project_id | The ID of the project in which the resource belongs | string | - | yes |
| gcs_bucket_storage_class| The availability of the bucket | string | REGIONAL | no |
| versioning_enabled | While set to true, versioning is fully enabled for this bucket | string | true | no |
| gcs_bucket_labels | A set of key/value label pairs to assign to the bucket | map| {} | no |
| enable_acl | Manages the access control list (ACL) for an object in a Google Cloud Storage (GCS) bucket | string| true | no |
| role_entity | List of role/entity pairs in the form ROLE:entity | list | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| gcs_bucket_url | The URL of the GCS bucket |
| gcs_bucket_uri | The URI of the GCS bucket |

## Run Tests