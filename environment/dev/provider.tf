terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backendrg"
    storage_account_name = "insiderbackendstg"
    container_name       = "dhirajbackend"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "d7097beb-42ed-4653-8e38-50c399bbc8d3"
  features {}
}
