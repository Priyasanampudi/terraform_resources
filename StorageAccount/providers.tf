<<<<<<< HEAD
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.91"
    }
  }
}
provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "test-githubactions"
    storage_account_name = "tfstatesa29"
    container_name       = "tfstatefile"
    key                  = "sa.tfstate"
  }
=======
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.91"
    }
  }
}
provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "test-githubactions"
    storage_account_name = "tfstatesa29"
    container_name       = "tfstatefile"
    key                  = "sa.tfstate"
  }
>>>>>>> dc1931cff0bb0ef136ae83715bd1e41cb4b8c026
}