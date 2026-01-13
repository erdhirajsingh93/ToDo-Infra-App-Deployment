##########################################################
#             Variables for Resource Groups               #
###########################################################

variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = optional(map(string))
    })
  )
}

##########################################################
#             Variables for Storage Accounts             #
###########################################################

variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
    })
  )
}

##########################################################
#             Variables for Virtual Networks             #
###########################################################

variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)

    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))

  }))
}

##########################################################
#             Variables for Public IPs                   #
###########################################################

variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}


##########################################################
#             Variables for VMSS                   #
###########################################################


variable "linux_vmss" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    sku                             = string
    instances                       = number
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    virtual_network_name            = string
    subnet_name                     = string


    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })


    os_disk = object({
      storage_account_type = string
      caching              = string
    })

    network_interface = map(object({
      name    = string
      primary = bool
      ip_configuration = object({
        name    = string
        primary = bool
      })


    }))

  }))

}

variable "key_vault" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string

    access_policy = object({
      key_permissions     = list(string)
      secret_permissions  = list(string)
      storage_permissions = list(string)
    })
  }))
}

variable "key_vault_secrets" {
    type = map(object({
      name = string
      value = string
      key_vault_name = string
      resource_group_name = string
    }))
  
}