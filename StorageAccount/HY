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
data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}
data "azurerm_virtual_network" "vnet" {
    name                     = var.virtual_network_name
    resource_group_name      = var.resource_group_name
}
data "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.virtual_network_name 
}
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account_network_rules" "sa_rules" {
  resource_group_name  = var.resource_group_name
  storage_account_name = azurerm_storage_account.sa.name

  default_action             = "Allow"
#   ip_rules                   = ["127.0.0.1"]
#   virtual_network_subnet_ids = "${azurerm_subnet.id}"
#   bypass                     = ["Metrics"]
}