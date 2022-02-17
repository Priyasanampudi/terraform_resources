resource "azurerm_resource_group" "rg" {
  name     = "rg-dih-${var.environment}-eus"
  location = var.location
  tags     = var.tags
}
