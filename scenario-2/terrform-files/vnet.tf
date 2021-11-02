resource "azurerm_virtual_network" "mainvnet" {
  name                       = var.mainvnetname
  address_space              = [var.vnet_address_space]
  resource_group_name        = azurerm_resource_group.maerksrg.name
  location                   = var.location
}

resource "azurerm_subnet" "subnet1" {
  name                       = var.subnet1
  address_prefixes           = [var.subnet_address_space1]
  virtual_network_name       = azurerm_virtual_network.mainvnet.name
  resource_group_name        = azurerm_resource_group.maerksrg.name
  service_endpoints          = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "subnet2" {
  name                       = var.subnet2
  address_prefixes           = [var.subnet_address_space2]
  virtual_network_name       = azurerm_virtual_network.mainvnet.name
  resource_group_name        = azurerm_resource_group.maerksrg.name
  service_endpoints          = ["Microsoft.Storage"]
}
