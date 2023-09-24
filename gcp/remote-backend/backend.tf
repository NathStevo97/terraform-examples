# https://developer.hashicorp.com/terraform/language/settings/backends/gcs
terraform {
  backend "gcs" {
    #bucket = "test-bucket-ochealthcheck3456" # pass in as env var following gcloud commands to create bucket
    prefix = "terraform/state"
  }
}