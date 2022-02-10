variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}
variable "app_service_plan" {
  description = "Name of the app service plan"
  type = string
}
variable "source_config" {
  description = "The object to configure app service sku."
  type = object({
    name = string
    tier = string
    size = string
    family = string
    capacity = string 
  })
}
variable "site_config" {
  description = "The object to configure app service site."
  type = object({
    dotnet_framework_version = string
  })
}
variable "app_service" {
  description = "Name of the app service"
  type = string
}
variable "tags" {
  description = "tags"
}
