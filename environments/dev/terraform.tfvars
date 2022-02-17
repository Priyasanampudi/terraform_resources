### Backend
resource_group_name  = rg-dih-dev-eus
storage_account_name = statesa-dih-dev-eus
container_name       = tfstatefile
key                  = rg.tfstate

##### Vnet 

tags                         = {
                                Application  = "DigitalIntigrationHub"
                                BusinessUnit = "MW pre-sales"
                                CostCenter   = "mwc"
                                Environment  = "Dev"
                                Region       = "EastUs"
                                Owner        = "MotifWorks"
}
