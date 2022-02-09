module "apimsubnet" {
    source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-subnet?ref=main"
    subnet_name          = var.subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.vnet_name 
    address_prefixes     = var.subnet_address_space
}