# -------------- Read Resource Gorup ----------------
data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}

# -------------- Create Public IP ----------------
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = var.pip_allocation_method
  sku                 = var.public_ip_sku
  tags                = var.tags
}