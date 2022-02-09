variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
}
variable "vnet_name" {
    description = "Name of the virtual network"
    type = string
}
variable "subnet_name" {
    description = "Name of the subnet"
    type = string
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
