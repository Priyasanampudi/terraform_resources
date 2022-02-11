location                     = "eastus"
resource_group_name          = "rg-dih-dev-eus"
network_security_group_name  = "diha-nsg-dev"
network_security_rule_name   = "diha-nsg-rules"
tags                    = {
                            ApplicationName = "Diha"
                            Region          = "eastUS"
                            Purpose         = "nsg"
}
