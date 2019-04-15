# GCP Google Cloud Storage (GCS) Terraform Module

Terraform module that creates GCS buckets in GCP

These types of resources are supported:

* [GCS](https://www.terraform.io/docs/providers/google/r/storage_bucket.html)

## Dependencies

* [gcloud](https://cloud.google.com/sdk/gcloud/)

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

$ gcloud config set project
```

```bash
# Machine Authentication (Gitlab, third parties etc)
#  - Create a Service Account with the relevant permissions using roles
```

* [Terraform >= v0.11.13](https://learn.hashicorp.com/terraform/getting-started/install.html)

**Note**: Both packages are available on [homebrew](https://brew.sh/)

## Usage

```hcl
module "example_gcs_bucket" {
  source                   = ".."
  gcs_bucket_name          = "example-bucket-name-857684958394"
  gcs_bucket_location      = "europe-west1"
  project_id               = "personal-230312"
  gcs_bucket_storage_class = "REGIONAL"
  versioning_enabled       = false

  gcs_bucket_labels = {
    name        = "example_gcs_bucket",
    createdby   = "joebloggs"
    environment = "uat"
    managedby   = "product_team"
  }
}
```
**Note**: Labels - Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. All characters must use UTF-8 encoding, and international characters are allowed.

## Examples

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| - | - | string | - | - |

## Outputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| - | - | string | - | - |

## Run Tests