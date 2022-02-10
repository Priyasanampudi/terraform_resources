variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}
variable "vnet_name" {
    type = string
    description = "Virtual network name"
}
variable "subnet_name" {
    type = string
    description = "Subnet name"
}
variable "subnet_address_space" {
    type = list(string)
    description = "Subnet prefix address list"
}
variable "enforce_private_link_endpoint_network_policies" {
    type = bool
    description = "private_link_endpoint_network_policies"
    default = false
}
variable "service_endpoints" {
    type = list(string)
    description = "service"
}
