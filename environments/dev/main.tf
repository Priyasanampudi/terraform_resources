## configure Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.91"
    }
  }
}
provider "azurerm" {
  features {}
}
# configured backend to store the tfstate file on azure storage account
terraform {
  backend "azurerm" {
    resource_group_name  = "test-githubactions"
    storage_account_name = "tfstatesa29"
    container_name       = "tfstatefile"
    key                  = "rg.tfstate"
  }
}


## to create a resource group
module "rg" {
  source                = "../../modules/azure-rg"
  location              = var.location
  rgname                = "rg-dih-dev-eus"
  tags                  = var.tags
}

# ## vnet [ data block ?]
# module "azure-devvnet" {
#   source             = "../../modules/azure-vnet"
#   location           = var.location
#   rgname             = module.azure-devrgroup.res_group_name
#   vnet_address_space = ["172.64.0.0/10"]
#   tags               = var.tags
# }

# # ## subnet [ data block ?]
# module "azure-apik8ssubnet" {
#   source     = "../../modules/azure-subnets"
#   cidr-range = "172.64.0.0/16"
#   rgname     = module.azure-devrgroup.res_group_name
#   snet-name  = var.snet-name
#   vnetname   = module.azure-devvnet.azvnet_name
#   env        = "dev"
# }

# # log analytics workspace
# module "azure-devlaworkspace" {
#   source                      = "../../modules/azure-log-analytics-workspace"
#   env                         = "dev"
#   location                    = var.location
#   log_analytics_workspace_sku = "PerGB2018"
#   resource_group_name         = module.azure-devrgroup.res_group_name
#   retention_in_days           = "30"
#   Application                 = var.Application
#   BusinessUnit                = var.BusinessUnit
#   CostCenter                  = var.CostCenter
#   RegionName                  = var.RegionName
#   Owner                       = var.Owner
# }



# # aks cluster 
# variable "k8sapikubernetes_client_id" {}
# variable "k8sapikubernetes_client_secret" {}


# module "azure-devk8sapicluster" {
#   source                     = "../../modules/azure-k8s-v2"
#   agent_pool_count           = "1"
#   agent_pool_vmsize          = "Standard_F8s_v2"
#   enable_auto_scaling        = "true"
#   env                        = "dev"
#   kubernetes_client_id       = var.k8sapikubernetes_client_id
#   kubernetes_client_secret   = var.k8sapikubernetes_client_secret
#   location                   = "eastus"
#   log_analytics_workspace_id = module.azure-devlaworkspace.log_analytics_workspace_id
#   min_count                  = "1"
#   os_disk_size_gb            = "150"
#   # os_username                = "ubuntu"
#   resource_group_name        = module.azure-devrgroup.res_group_name
#   vnet_id                    = module.azure-apik8ssubnet.stg-snet-id
#   Application                = var.Application
#   BusinessUnit                = var.BusinessUnit
#   CostCenter                  = var.CostCenter
#   RegionName                  = var.RegionName
#   Owner                       = var.Owner
# }

# # ACR
# module "azure-devacr" {
#   source              = "../../modules/azure-container-registry"
#   acr_sku             = "premium"
#   env                 = "dev"
#   location            = "eastus"
#   resource_group_name = module.azure-devrgroup.res_group_name
#   Application                = var.Application
#   BusinessUnit                = var.BusinessUnit
#   CostCenter                  = var.CostCenter
#   RegionName                  = var.RegionName
#   Owner                       = var.Owner
# }

# ## ACR private-endpoint
# module "azure-private-endpoint"{
#   source              = "../../modules/azure-private-endpoint"
#   rgname              =  module.azure-devrgroup.res_group_name
#   location           = "eastus"
#   subnet_id          = module.azure-apik8ssubnet.stg-snet-id
#   private_connection_resource_id = module.azure-devacr.id
# }
