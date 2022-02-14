location                     = "eastus"
resource_group_name          = "rg-dih-dev-eus"
api_management               = "apim-dih-dev-eus"
publisher_name               = "MotifWorks"
publisher_email              = "priyanka.sanampudi@motifworks.com"
sku_name                     = "Developer_1"
virtual_network_type         = "Internal"
vnet_name                    = "diha-vnet"
subnet_name                  = "APIManagementSubnet"
tags                         = {
                                Application  = "DigitalIntigrationHub"
                                BusinessUnit = "MotifWorks"
                                CostCenter   = "YetToDecide"
                                Environment  = "Dev"
                                Region       = "EastUs"
                                Owner        = "MotifWorks"
}

