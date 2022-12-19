remote_state {
 backend = "azurerm"
 generate = {
   path      = "backend.tf"
   if_exists = "overwrite_terragrunt"
 }
 config = {
   resource_group_name  = "d-emea-iac-tfstate-rg" # $REPLACE: Adapt to your resource group defined in _init
   storage_account_name = "demeatfstate2022"              # $REPLACE: Adapt to your storage account defined in _init
   container_name       = "tfstate"
   key                  = "${path_relative_to_include()}/terraform.tfstate"
 }
}
