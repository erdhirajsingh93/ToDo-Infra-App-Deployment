
variable "linux_vmss" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku = string
    instances = number
    key_vault_name = string
    key_vault_secret_username = string
    key_vault_secret_password = string
    disable_password_authentication = bool
    virtual_network_name = string
    subnet_name = string


    source_image_reference = object({
      publisher = string
      offer = string
      sku = string
      version = string
    })


    os_disk = object({
      storage_account_type = string
      caching = string
    })

    network_interface = map(object({
      name = string
      primary = bool
      ip_configuration = object({
        name = string
        primary = bool
      })
       
    
    }))

  }))
  
}