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

variable "expiration" {
  description = "TTL of tables using the dataset in MS"
  default     = null
}

variable "time_partitioning" {
  description = "Configures time-based partitioning for this table"
}

variable "dataset_labels" {
  description = "A mapping of labels to assign to the table"
  type        = map(string)
}

variable "tables" {
  description = "A list of maps that includes both table_id and schema in each element, the table(s) will be created on the single dataset"
  default     = []
  type        = list(object({
    table_id  = string,
    schema    = string,
    labels    = map(string),
}))
}