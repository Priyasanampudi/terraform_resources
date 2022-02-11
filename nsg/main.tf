module "nsg" {
    source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-nsg?ref=main"
    nsg_name                  = var.network_security_group_name
    resource_group_name       = var.resource_group_name
    tags                      = var.tags
}
resource "azurerm_network_security_rule" "nsgrules" {
  name                        = var.network_security_rule_name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}
