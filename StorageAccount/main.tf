data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}
data "azurerm_virtual_network" "vnet" {
    name                     = var.vnet_name
    resource_group_name      = var.resource_group_name
}
module "coresubnet" {
  source               = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-subnet?ref=main"
  vnet_name            = var.vnet_name
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_address_space = var.subnet_address_space
  service_endpoints    = ["Microsoft.Storage"]
}
module "storageAccount" {
  source                   = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-storage-account?ref=main"
  storage_account_name     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_account_network_rules" "sa_rules" {
  storage_account_id = module.storageAccount.id

  default_action             = "Allow"
  bypass                     = ["AzureServices"]
  virtual_network_subnet_ids = [module.coresubnet.id]
}
