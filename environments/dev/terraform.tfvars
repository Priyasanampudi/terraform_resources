### Backend
resource_group_name  = rg-dih-dev-eus
storage_account_name = statesa-dih-dev-eus
container_name       = tfstatefile
key                  = rg.tfstate

##### AKS
location           = "eastus"
#rgname             = "stage"
Application        = "DIH"
BusinessUnit       = "mw pre-sales"
CostCenter         = "mwc"
RegionName         = "eastus"
Owner              = "mw"
snet-name          = "devsubnetaks"
k8sapikubernetes_client_id = "03aa0000-23b1-49cf-8249-aff7fde9feb1"
k8sapikubernetes_client_secret ="j1n7Q~H2vtIszBajbxq0MWqanLtaFalcbuGPl"
##### Vnet 
rgname                       = "rg-dih-dev-eus"
vnet_name                    = "vnet-dih-dev-eus"
vnet_address_space           = ["172.16.0.0/16"]
environment                  = dev
tags                         = {
                                Application  = "DigitalIntigrationHub"
                                BusinessUnit = "MW pre-sales"
                                CostCenter   = "mwc"
                                Environment  = "Dev"
                                Region       = "EastUs"
                                Owner        = "MotifWorks"
}
