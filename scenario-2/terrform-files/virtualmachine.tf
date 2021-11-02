# Version 1
resource "azurerm_network_interface" "nic1" {
 # count = var.wkst_v5_count

  name                = "internal"
  resource_group_name = azurerm_resource_group.maerksrg.name
  location            = azurerm_resource_group.maerksrg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "dynamic"
  }

  #tags = var.tags

}

resource "azurerm_virtual_machine" "MainVM1" {

  name                             = "VM1"
  location                         = azurerm_resource_group.maerksrg.location
  resource_group_name              = azurerm_resource_group.maerksrg.name
  network_interface_ids            = [element(azurerm_network_interface.nic1.*.id, count.index)]
  vm_size                          = "Standard_DS1_v2"
  delete_os_disk_on_termination    = "true"
  delete_data_disks_on_termination = "true"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}DataDisk1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = var.machine_disk_size
  }


  os_profile {
    computer_name  = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS"
    admin_username = "vm1_admin"
	admin_password=azurerm_key_vault_secret.vmpd1.value
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}

# Version 2

resource "azurerm_network_interface" "nic2" {
 # count = var.wkst_v5_count

  name                = "internal"
  resource_group_name = azurerm_resource_group.maerksrg.name
  location            = azurerm_resource_group.maerksrg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "dynamic"
  }

  #tags = var.tags

}

resource "azurerm_virtual_machine" "MainVM2" {

  name                             = "VM2"
  location                         = azurerm_resource_group.maerksrg.location
  resource_group_name              = azurerm_resource_group.maerksrg.name
  network_interface_ids            = [element(azurerm_network_interface.nic2.*.id, count.index)]
  vm_size                          = "Standard_DS1_v2"
  delete_os_disk_on_termination    = "true"
  delete_data_disks_on_termination = "true"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}DataDisk1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = var.machine_disk_size
  }


  os_profile {
    computer_name  = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS"
    admin_username = "vm2_admin"
    admin_password=azurerm_key_vault_secret.vmpd2.value
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
  }
