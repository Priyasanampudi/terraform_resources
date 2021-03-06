module "apimsubnet" {
    source = "git::https://github.com/Priyasanampudi/terraform_resources.git//modules/tf-module-subnet?ref=main"
    subnet_name          = var.subnet_name
    resource_group_name  = var.resource_group_name
    vnet_name            = var.vnet_name 
    subnet_address_space = var.subnet_address_space
    enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
    service_endpoints        = var.service_endpoints
}
