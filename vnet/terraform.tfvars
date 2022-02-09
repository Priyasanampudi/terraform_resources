location                     = "eastus"
resource_group_name          = "DigiHubRG"
network_security_group_name  = "diha-nsg-dev"
vnet_name                    = "diha-vnet"
vnet_address_space           = ["172.16.0.0/16"]
network_security_rule_name   = "diha-nsg-rules"
tags                    = {
                            ApplicationName = "Diha"
                            Region          = "eastUS"
                            Purpose         = "Vnet"
}
