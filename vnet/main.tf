resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_network_security_group" "nsg" {
    name                      = var.network_security_group_name
    resource_group_name       = azurerm_resource_group.rg.name
    location                  = azurerm_resource_group.rg.location
}
resource "azurerm_network_security_rule" "nsgrules" {
  name                        = var.network_security_rule_name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
module "vnet" {
  source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-vnet?ref=main"
  vnet_name                 = var.vnet_name
  resource_group_name       = var.resource_group_name
  location                  = azurerm_resource_group.rg.location 
  dns_servers               = "azure DNS"
  vnet_address_space        = var.vnet_address_space
  tags                      = var.tags  
}
