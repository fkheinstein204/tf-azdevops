terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }

 backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stjl9c6xu2"
    container_name       = "tfstate"
    key                  = "simpleapp.tfstate"
  }
}
