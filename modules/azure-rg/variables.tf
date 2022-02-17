variable "location" {
  description = "Resource Group Location"
  type = string
  #default = "eastus"
}
variable "environment" {
  description = "Resource Group name"
  type = string
  #default = "rg-dih-dev-eus"
}
variable "tags" {
  description  = "Tags to be applied"
}
