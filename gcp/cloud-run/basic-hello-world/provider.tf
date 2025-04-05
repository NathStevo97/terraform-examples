terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.85.0"
    }
  }
}

provider "google" {
  credentials = file("${var.key_name}")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}