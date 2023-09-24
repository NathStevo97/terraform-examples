terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.25.0"
    }
  }
}

provider "azurerm" {
  # Configuration options for Azure resources, such as key vaults, templates for deployments etc (features option must be used for Azure versions >2.0)
  features {
  }
}