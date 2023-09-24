data "archive_file" "package" {
  type        = "zip"
  output_path = "/tmp/hello-world-gradle.zip"
  source_dir  = "../hello-world-gradle"
}

resource "google_storage_bucket" "function-bucket" {
  name                        = "${var.project_id}-function-bucket"
  project                     = var.project_id
  location                    = "EU"
  force_destroy               = true
  uniform_bucket_level_access = true
  storage_class               = "STANDARD"

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_object" "package-zip" {
  name   = "hello-world-gradle.${data.archive_file.package.output_sha}.zip"
  bucket = google_storage_bucket.function-bucket.id
  source = data.archive_file.package.output_path
}

resource "google_cloudfunctions_function" "function" {
  name    = "hello-world-gradle"
  runtime = "java17"

  # Get the source code of the cloud function as a Zip compression
  source_archive_bucket = google_storage_bucket.function-bucket.name
  source_archive_object = google_storage_bucket_object.package-zip.name

  entry_point = "functions.HelloWorld"

  trigger_http = true

  depends_on = [
    google_storage_bucket.function-bucket, # declared in `storage.tf`
    google_storage_bucket_object.package-zip
  ]
}