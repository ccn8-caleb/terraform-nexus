# Resource Group

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.region_primary
}

# Virtual Machine

resource "azurerm_linux_virtual_machine" "mainHost" {
  name                  = "${var.identifier}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  size                  = "Basic_A1"
  admin_username        = data.azurerm_key_vault_secret.vm_admin_username.value
  admin_password        = data.azurerm_key_vault_secret.vm_admin_password.value

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    name                  = "osdisk"
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
    disk_size_gb          = 64
  }

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file(var.admin_ssh_public_key_path)
  }
}