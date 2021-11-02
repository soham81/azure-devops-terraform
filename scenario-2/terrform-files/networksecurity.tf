resource "azurerm_network_security_group" "networkgroup" {
  name                = "networksecgroup"
  location            = azurerm_resource_group.mmaerksrg.location
  resource_group_name = azurerm_resource_group.maerksrg.name

  #tags                = var.tags

}

resource "azurerm_network_security_rule" "Port_8080" {
  name                        = "Port_8080"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "TCP"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.maerksrg.name
  network_security_group_name = azurerm_network_security_group.networkgroup.name
}

resource "azurerm_network_security_rule" "AllowXoriantPune" {
  name                        = "AllowXoriantPune"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.maerksrg.name
  network_security_group_name = azurerm_network_security_group.networkgroup.name
}
