variable "project_id" {
  type        = string
  description = "GCP Project ID for resource deployment"
}

variable "region" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2"
}

variable "zone" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2-a"
}