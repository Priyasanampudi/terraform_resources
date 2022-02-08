variable "resource_group_name" {
  type = string
  description = "Default resource group name that the network will be created in."
}
variable "vnet_name"{
  type = string
  description = "Provide vnet name"
}
variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}
# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  type        = list(string)
  description = "The DNS servers to be used with vNet. default is Azure DNS"
}
variable "tags"{
}
