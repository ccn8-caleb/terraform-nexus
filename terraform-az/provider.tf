terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ""
    }
  }
}

provider "azurerm" {
  account_id = var.account_id
  region = var.region_primary
}