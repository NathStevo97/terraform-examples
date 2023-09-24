variable "key_name" {
  type        = string
  description = "Path to file for service account credentials"
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

variable "zone" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2-a"
}

variable "private_key" {
  type        = string
  description = "ssh private key"
}

variable "public_key" {
  type        = string
  description = "ssh public key"
}

variable "ssh_user" {
  type        = string
  description = "ssh user name"
}