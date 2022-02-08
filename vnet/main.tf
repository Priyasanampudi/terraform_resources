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
module "azurerm_virtual_network" {
    source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-vnet?ref=main"
    name                      = var.virtual_network_name
    resource_group_name       = azurerm_resource_group.rg.name
    location                  = azurerm_resource_group.rg.location    
    address_space             = ["172.16.0.0/16"]
}
module "azurerm_subnet" {
    source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-vnet?ref=main"
    vnet_name            = "var.virtual_network_name"
    resource_group_name  = azurerm_resource_group.rg.name
    azurerm_subnet       = "var.azurerm_subnet"
    address_prefixes     = "var.subnet_address_space"
    tags                 = var.tags
}
