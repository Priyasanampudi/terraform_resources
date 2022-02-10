data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan
  location            = var.location
  resource_group_name = var.resource_group_name
  sku  {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = var.app_service
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  site_config         = var.site_config
}
