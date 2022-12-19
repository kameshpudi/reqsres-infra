data "terraform_remote_state" "iac_logging" {
  backend = "azurerm"

  config = {
    resource_group_name  = "d-emea-iac-tfstate-rg"
    storage_account_name = "demeatfstate2022"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
