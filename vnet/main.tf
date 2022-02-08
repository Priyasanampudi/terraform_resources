<<<<<<< HEAD
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
module "azurerm_virtual_network" "vnet" {
    name                      = var.virtual_network_name
    resource_group_name       = azurerm_resource_group.rg.name
    location                  = azurerm_resource_group.rg.location    
    address_space             = ["172.16.0.0/16"]
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name1"
    address_prefix = "172.16.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name2"
    address_prefix = "172.16.2.0/24"
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name3"
    address_prefix = "172.16.3.0/24"
    security_group = azurerm_network_security_group.nsg.id
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name4"
    address_prefix = "172.16.4.0/24"
    security_group = azurerm_network_security_group.nsg.id
}

tags = {
    createdBy = "Priyanka"
    application = "DigitalIntegrationHubAccelerator"
=======
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
module "azurerm_virtual_network" "vnet" {
    name                      = var.virtual_network_name
    resource_group_name       = azurerm_resource_group.rg.name
    location                  = azurerm_resource_group.rg.location    
    address_space             = ["172.16.0.0/16"]
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name1"
    address_prefix = "172.16.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name2"
    address_prefix = "172.16.2.0/24"
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name3"
    address_prefix = "172.16.3.0/24"
    security_group = azurerm_network_security_group.nsg.id
}
module "azurerm_subnet" {
    source = ""
    name           = "var.subnet_name4"
    address_prefix = "172.16.4.0/24"
    security_group = azurerm_network_security_group.nsg.id
}

tags = {
    createdBy = "Priyanka"
    application = "DigitalIntegrationHubAccelerator"
>>>>>>> dc1931cff0bb0ef136ae83715bd1e41cb4b8c026
}