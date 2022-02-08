location                     = "eastus"
resource_group_name          = "DigiHubRG"
network_security_group_name  = "diha-nsg-dev"
virtual_network_name         = "diha-vnet"
network_security_rule_name   = "diha-nsg-rules"
subnet_name               = "APIManagementSubnet"
subnet_address_space         = "172.16.1.0/24"
tags                    = {
                            ApplicationName = "Diha"
                            Region          = "eastUS"
                            Purpose         = "Vnet"
}
