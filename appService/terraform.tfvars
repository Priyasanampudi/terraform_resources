location                     = "eastus"
resource_group_name          = "DigiHubRG"
app_service_plan             = "asp-diha"
sku = {
    tier = "Standard"
    size = "S1"
}
site_config = {
    dotnet_framework_version = "v4.0"
}
app_service                  = "diha-webapp"
tags = {
    ApplicationName = "DIHA"
    Environment     = "dev"
}