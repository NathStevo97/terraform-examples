variable "function_name" {
  description = "A user-defined name of the function."
  type        = string
  default     = "sample-pub-sub"
}

variable "location" {
  description = "The location of this cloud function."
  type        = string
  default     = "europe-west2"
}

variable "zone" {
  type        = string
  description = "GCP Region for resource deployment"
  default     = "europe-west2-a"
}

variable "description" {
  description = "User-provided description of a function."
  type        = string
  default     = "Cloud function example managed by Terraform"
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}
