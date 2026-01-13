resource "azurerm_key_vault_secret" "azurerm_key_vault_secrets" {
    for_each = var.key_vault_secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}


