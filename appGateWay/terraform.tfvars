resource_group_name     = "DigiHubRG"
vnet_name               = "diha-vnet"
subnet_name             = "GatewaySubnet"
subnet_address_space    = ["172.16.2.0/24"]
public_ip_name          = "pip-agw"
public_ip_sku           = "Standard"
pip_allocation_method   = "Static"
private_ip_address_allocation = "Static"
private_ip_address      = "172.16.2.5"
app_gateway_name        = "agw-diha"


gateway_ip_configuration = {
    name = "gateway-ip-configuration"
}
sku = {
    name = "Standard_Small"
    tier = "Standard"
    capacity = 2
}
tags = {
    Purpose         = "App gateway"
}

nsg_name                = "diha-nsg-dev"
