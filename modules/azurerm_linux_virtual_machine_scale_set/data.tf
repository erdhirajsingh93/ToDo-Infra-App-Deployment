data "azurerm_subnet" "subnets" {
    for_each = var.linux_vmss
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  for_each = var.linux_vmss
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault_secret" "key_vault_secret_username" {
  for_each = var.linux_vmss
  name         = each.value.key_vault_secret_username
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "key_vault_secret_password" {
  for_each = var.linux_vmss
  name         = each.value.key_vault_secret_password
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}