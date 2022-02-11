resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
module "vnet" {
  source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-vnet?ref=main"
  vnet_name                 = var.vnet_name
  resource_group_name       = var.resource_group_name 
  dns_servers               = "azure DNS"
  vnet_address_space        = var.vnet_address_space
  location                  = var.location
  tags                      = var.tags  
}
