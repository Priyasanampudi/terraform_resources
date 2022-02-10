location                     = "eastus"
resource_group_name          = "DigiHubRG"
storage_account_name         = "dihasadev"
vnet_name                    = "diha-vnet"
subnet_name                  = "Core_Subnet"
subnet_address_space         = ["172.16.3.0/24"]
account_tier                 = "Standard"
account_replication_type     = "GRS"
tags = {
    ApplicationName = "DIHA"
    Environment     = "dev"
}

