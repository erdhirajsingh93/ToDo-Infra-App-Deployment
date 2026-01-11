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
      name = string
      resource_group_name = string
      location = string
      allocation_method = string
      tags = optional(map(string))
    }))
}


##########################################################
#             Variables for Public IPs                   #
###########################################################

