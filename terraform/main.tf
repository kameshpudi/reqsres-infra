resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  #tags     = var.tags
}

resource "azurerm_app_service_plan" "plan" {
  name                = var.plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "service" {
  name                = var.service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "PYTHON|3.11"
  }

}
