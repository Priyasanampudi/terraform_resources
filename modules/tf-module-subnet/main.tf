# ------------- Read Existing Resource Group Details -------------
data "azurerm_resource_group" "rg" {
    name        = var.resource_group_name
}
# ------------- Read Existing Virtual Network Details -------------
data "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    resource_group_name = data.azurerm_resource_group.rg.name
}
# ------------- Create Subnet -------------
resource "azurerm_subnet" "subnet" {
  name                                            = var.subnet_name
  resource_group_name                             = data.azurerm_resource_group.rg.name
  virtual_network_name                            = var.vnet_name
  address_prefixes                                = var.subnet_address_space
  service_endpoints                               = element(var.service_endpoints)
  enforce_private_link_endpoint_network_policies  = var.enforce_private_link_endpoint_network_policies
}
