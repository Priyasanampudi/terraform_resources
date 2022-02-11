location                     = "eastus"
resource_group_name          = "rg-dih-dev-eus2"
vnet_name                    = "diha-vnet"
vnet_address_space           = ["172.16.0.0/16"]
tags                    = {
                            ApplicationName = "Diha"
                            Region          = "eastUS"
                            Purpose         = "Vnet"
}
