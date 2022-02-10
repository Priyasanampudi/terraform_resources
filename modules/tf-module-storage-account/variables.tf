variable "resource_group_name" {
    type = string
    description = "Resource group name"
}
variable "location" {
    type = string
    description = "Region name"
}
variable "storage_account_name" {
    type = string
    description = "Storage account name"
}
variable "account_tier" {
    type = string
    description = "Account tier"
}
variable "account_replication_type" {
    type = string
    description = "Account replication type"
}
variable "service_endpoints" {
  description = "service endpoints"
  type = list
}
variable "tags" {
    description = "Provide tags for this resource"
}
