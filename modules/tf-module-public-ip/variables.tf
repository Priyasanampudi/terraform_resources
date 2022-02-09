variable "resource_group_name" {
    type = string
    description = "Resource group name"
}
variable "public_ip_name" {
    type = string
    description = "Public IP name"
}
variable "pip_allocation_method" {
    type = string
    description = "IP allocation method. Default is Dynamic"
    default = "Dynamic"
}
variable "public_ip_sku" {
    type        = string
    description = "SKU of Public IP (Basic/Standard). Default value is Basic"
    default     = "Basic"
}
variable "domain_name_label" {
    type        = string
    description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
    default     = null
}
variable "tags" {
    description = "Provide tags for pubic IP"
}