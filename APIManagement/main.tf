data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}
data "azurerm_virtual_network" "vnet" {
    name                     = var.vnet_name
    resource_group_name      = var.resource_group_name
}
data "azurerm_subnet" "apim" {
    name                     = var.subnet_name
    resource_group_name      = var.resource_group_name
}

resource "azurerm_api_management" "apim" {
  name                  = var.api_management
  location              = var.location
  resource_group_name   = var.resource_group_name
  publisher_name        = var.publisher_name
  publisher_email       = var.publisher_email
  sku_name              = var.sku_name 
  virtual_network_type  = var.virtual_network_type
  virtual_network_configuration {
      subnet_id = data.azurerm_subnet.apim.id
  }
  tags                = var.tags
  
}
