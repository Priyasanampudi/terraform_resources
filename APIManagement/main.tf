data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

resource "azurerm_api_management" "apim" {
  name                = var.api_management
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name 
  tags                = var.tags
}