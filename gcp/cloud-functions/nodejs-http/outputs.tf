output "id" {
  description = "An identifier for the resource with format `projects/{{project}}/locations/{{location}}/functions/{{name}}`"
  value       = google_cloudfunctions2_function.cloud-function.id
}

output "environment" {
  description = "The environment the function is hosted on"
  value       = google_cloudfunctions2_function.cloud-function.environment
}

output "state" {
  description = "Describes the current state of the function"
  value       = google_cloudfunctions2_function.cloud-function.state
}

output "update_time" {
  description = "The last update timestamp of a Cloud Function"
  value       = google_cloudfunctions2_function.cloud-function.update_time
}

output "uri" {
  description = "The uri to reach the function"
  value       = google_cloudfunctions2_function.cloud-function.service_config[0].uri
}