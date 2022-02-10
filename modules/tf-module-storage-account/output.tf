output "id" {
  value = azurerm_storage_account.stacnt.id
  description = "The storage account id"
}
output "name" {
  value = azurerm_storage_account.stacnt.name
  description = "The storage account name"
}
output "primary_key" {
  description = "The primary access key for the storage account"
  value = azurerm_storage_account.stacnt.primary_access_key
  sensitive   = true
}
