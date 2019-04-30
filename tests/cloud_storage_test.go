package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformCloudStorage(t *testing.T) {
	t.Parallel()

	// Get the Project Id to use
	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)

	// Create all resources in the following zone
	zone := "europe-west2"

	// Give the example bucket a unique name so we can distinguish it from any other bucket in your GCP account
	expectedBucketName := fmt.Sprintf("terratest-gcp-cloud-storage-%s", strings.ToLower(random.UniqueId()))

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"gcs_bucket_location": zone,
			"gcs_bucket_name":     expectedBucketName,
			"project_id":          projectId,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	//
	// TODO - we might need to sleep for a bit before running destroy in case the resources haven't
	// been fully initialized, but for now it seems to work fine.
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of some of the output variables
	bucketURL := terraform.Output(t, terraformOptions, "gcs_bucket_url")
	bucketURI := terraform.Output(t, terraformOptions, "gcs_bucket_uri")

	// Verify that the new bucket url matches the expected url
	expectedURL := fmt.Sprintf("gs://%s", expectedBucketName)
	assert.Equal(t, expectedURL, bucketURL)

	// Verify that the new bucket uri matches the expected uri
	expectedURI := fmt.Sprintf("https://www.googleapis.com/storage/v1/b/%s", expectedBucketName)
	assert.Equal(t, expectedURI, bucketURI)

	// Verify that the Storage Bucket exists
	gcp.AssertStorageBucketExists(t, expectedBucketName)
}
