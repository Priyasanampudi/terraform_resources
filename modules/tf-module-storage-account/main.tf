<<<<<<< HEAD
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
resource "azurerm_storage_account" "stacnt" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}
=======
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
resource "azurerm_storage_account" "stacnt" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}
>>>>>>> dc1931cff0bb0ef136ae83715bd1e41cb4b8c026
