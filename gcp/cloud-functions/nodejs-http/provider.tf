terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.85.0"
    }
  }

  backend "local" {}
}

provider "google" {
  project = var.project
  region  = var.location
  zone    = var.zone
}