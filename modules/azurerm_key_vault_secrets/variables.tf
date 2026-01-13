variable "key_vault_secrets" {
    type = map(object({
      name = string
      value = string
      key_vault_name = string
      resource_group_name = string
    }))
  
}