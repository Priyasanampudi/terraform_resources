variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}
variable "api_management" {
  description = "Name of the apim"
  type = string
}
variable "publisher_name" {
    description = "Name of the publisher name"
    type = string
}
variable "publisher_email" {
    description = "Publisher email"
    type = string
}
variable "sku_name" {
    description = "Name of the sku to be used"
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
variable "virtual_network_type" {
    description = "type of network to be used"
    type = string
}
variable "tags" {
    description = "tags"
}
