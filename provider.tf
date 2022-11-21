# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.31.0"
    }
  }
}

# 2. Define the provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
