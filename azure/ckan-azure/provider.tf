terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  # Configuration options for Azure resources, such as key vaults, templates for deployments etc
  features {
  }
}