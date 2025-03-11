

data "azurerm_key_vault" "secure" {
    name                = var.key_vault_name
    resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "vm_admin_username" {
    name         = var.vm_admin_username_secret_name
    key_vault_id = data.azurerm_key_vault.secure.id
}

data "azurerm_key_vault_secret" "vm_admin_password" {
    name         = var.vm_admin_password_secret_name
    key_vault_id = data.azurerm_key_vault.secure.id
}