# Bucket to house function source code
resource "google_storage_bucket" "function_bucket" {
  name          = "${var.project_id}-function"
  location      = var.region
  project       = var.project_id
  force_destroy = true
}

# Bucket to house files to be monitored by function
resource "google_storage_bucket" "input_bucket" {
  name          = "${var.project_id}-input"
  location      = var.region
  project       = var.project_id
  force_destroy = true
}