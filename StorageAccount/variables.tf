variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}
variable "storage_account_name" {
  description = "Name of the storage account"
  type = string
}
variable "vnet_name" {
  description = "Name of the storage account"
  type = string
}
variable "subnet_name" {
  description = "Name of the storage account"
  type = string
}
variable "subnet_address_space" {
    type = list(string)
    description = "Subnet prefix address list"
}
variable "account_tier" {
  description = "tier"
  type = string
}
variable "account_replication_type" {
  description = "replication"
  type = string
}
variable "tags" {
  description = "tags"
}
