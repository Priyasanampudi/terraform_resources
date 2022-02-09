resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  tags                = var.tags
  
}
