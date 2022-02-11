variable "resource_group_name" {
    type = string
    description = "Resource group name for application gateway resource"
}
variable "vnet_name" {
    type = string
    description = "Virtual network name"
}
variable "subnet_name" {
    type = string
    description = "Front end subnet name"
}
variable "subnet_address_space" {
    type = list(string)
    description = "Subnet prefix address list"
}
variable "public_ip_name" {
    type = string
    description = "Public IP name for application gateway resource"
}
variable "pip_allocation_method" {
    type = string
    description = "IP allocation method for application gateway resource"
}
variable "public_ip_sku" {
    type = string
    description = "SKU for the app gateway public ip"
}
variable "private_ip_address_allocation" {
    type = string
    description = "Private IP allocation method for application gateway resource"
}
variable "private_ip_address" {
    type = string
    description = "Private IP address"
}
variable "app_gateway_name" {
    type = string
    description = "Application Gateway Name"
}
variable "gateway_ip_configuration" {
    type = object({
        name = string
    })
    description = "Application gateway ip configuration"
}
variable "sku" {
    type = object({
        name = string
        tier = string
        capacity = number
    })
    description = "SKU specification for application gateway resource"
}
variable "service_endpoints" {
    type = list(string)
    description = "service end points"
}
variable "tags"{
    description = "Provide tags for application gateway"
}

#### NSG vars
variable "nsg_name" {
    type = string
    description = "Name of the network security group"
}
