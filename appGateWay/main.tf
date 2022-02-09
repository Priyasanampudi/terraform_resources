data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}

#--------------- Create subnet ----------------
module "agwsubnet" {
  source               = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-subnet?ref=main"
  vnet_name            = var.vnet_name
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_address_space = var.subnet_address_space
}

resource "azurerm_network_security_rule" "Allow_GWM" {
  name                        = "Allow_GWM"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}

# resource "azurerm_network_security_rule" "Allow_AzureLoadBalancer" {
#   name                        = "Allow_AzureLoadBalancer"
#   priority                    = 110
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "AzureLoadBalancer"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = var.nsg_name
#   depends_on                  = [module.nsg]
# }

resource "azurerm_network_security_rule" "DenyAllInbound_Internet" {
  name                        = "DenyAllInbound_Internet"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}

# resource "azurerm_subnet_network_security_group_association" "snet-nsg-association" {
#   subnet_id                 = module.agwsubnet.id
#   network_security_group_id = module.nsg.id
#   depends_on                = [module.nsg]
# }

#------------ Create Public IP ---------------
module "publicip" {
  source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-public-ip?ref=main"
  resource_group_name     = var.resource_group_name
  public_ip_name          = var.public_ip_name
  pip_allocation_method   = var.pip_allocation_method
  public_ip_sku           = var.public_ip_sku
  tags                    = var.tags
  depends_on = [module.agwsubnet]
}

# ---------- local block variables ------------
locals {
  frontend_ip_configuration_name = "${var.vnet_name}-feip"
  frontend_ip_configuration_name_public = "${var.vnet_name}-feip-public"
  backend_address_pool_name      = "${var.vnet_name}-beap"
  frontend_port_name             = "${var.vnet_name}-feport"
  http_setting_name              = "${var.vnet_name}-be-htst"
  listener_name                  = "${var.vnet_name}-httplstn"
  request_routing_rule_name      = "${var.vnet_name}-rqrt"
}
# ---------- Create Application Gateway ------------
resource "azurerm_application_gateway" "network" {
  name                = var.app_gateway_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.sku.capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration.name
    subnet_id = module.agwsubnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    subnet_id            = module.agwsubnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address   = var.private_ip_address
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = module.publicip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  tags                         = var.tags
}
