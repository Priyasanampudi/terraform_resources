resource_group_name     = "rg-dih-dev-eus"
vnet_name               = "diha-vnet"
subnet_name             = "agw_Subnet"
subnet_address_space    = ["172.16.5.0/24"]
public_ip_name          = "pip-agw"
public_ip_sku           = "WAF v2"
pip_allocation_method   = "Static"
private_ip_address_allocation = "Static"
private_ip_address      = "172.16.5.5"
app_gateway_name        = "agw-diha"
service_endpoints       = []


gateway_ip_configuration = {
    name = "gateway-ip-configuration"
}
sku = {
    name = "Standard_v2"
    tier = "Standard_v2"
    capacity = 1
}
tags = {
    Purpose         = "App gateway"
}

nsg_name                = "diha-nsg-dev"
