resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "rg-dih-${var.environment}-eus"
  tags     = var.tags
}
