resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  #tags     = var.tags
}

resource "azurerm_app_service_plan" "plan" {
  name                = var.plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true
  
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
  lifecycle {
    ignore_changes = [
      kind
    ]
  }
}


resource "azurerm_storage_account" "stg" {
  name                     = var.stg_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_function_app" "function" {
  name                       = var.service_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.stg.name
  storage_account_access_key = azurerm_storage_account.stg.primary_access_key
  os_type                    = "linux"
  version                    = "~4"

  app_settings {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }
  site_config {
    linux_fx_version = "python|3.11"
  }
}
