#terraform {
  #provider "azurerm" {}

  backend "azurerm" {
    storage_account_name = "stomaerskaccount"
    container_name       = "terraformstatecontainername"
    resource_group_name  = "RGP-MAIN_MAERSK"
    access_key           = "xxxxx"
    key                  = "marsk.tfstate"
  }
#}
