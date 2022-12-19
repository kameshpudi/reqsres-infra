terraform {
  backend "azurerm" {
    resource_group_name  = "d-emea-iac-tfstate-rg"
    storage_account_name = "demeatfstate2022"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
