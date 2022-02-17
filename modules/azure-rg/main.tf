resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.resource_group
  tags     = var.tags
}
