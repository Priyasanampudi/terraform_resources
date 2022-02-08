data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  tags                = var.tags
  
}
