variable "key_name" {
  type        = string
  description = "Path to file for service account credentials"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "google compute instance type"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID for resource deployment"
}

variable "region" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2"
}

variable "resource_prefix" {
  type        = string
  default     = "gpc-demo"
  description = "Standard Resource Prefix"
}

variable "zone" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2-a"
}
