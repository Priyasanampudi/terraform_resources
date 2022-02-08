variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}

variable "network_security_group_name" {
  description = "Name of the nsg"
  type = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type = string
}
variable "network_security_rule_name" {
    description = "Name of the nsg rules"
    type = string
}
variable "subnet_name" {
    description = "Name of the subnet"
    type = string
}
variable "address_prefix_subnet" {
    description = "adress prefix of subnet"
    type = string
}