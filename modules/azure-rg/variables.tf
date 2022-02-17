variable "location" {
  description = "Resource Group Location"
  default = "eastus"
}
variable "resource_group" {
  description = "Resource Group name"
}
variable "environment" {
  description  = "environment of the application"
}
variable "tags" {
  description  = "Tags to be applied"
}
