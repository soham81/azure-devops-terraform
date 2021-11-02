resource "azurerm_resource_group" "maerksrg" {
    name     = "RGP-${var.location_name}-${var.application_name}-${var.environment_name}"
    location = var.location
  }

resource "azurerm_storage_account" "storageaccounttest" {
  name                              = "storageaccountexample"
  resource_group_name               = azurerm_resource_group.marksg.name
  location                          = var.location
  account_kind                      = "StorageV2"
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  enable_https_traffic_only         = true
  }
