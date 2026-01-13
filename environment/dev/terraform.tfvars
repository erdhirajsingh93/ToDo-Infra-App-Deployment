resource_groups = {
  rg1 = {
    name       = "dhirajrg-1"
    location   = "central india"
    managed_by = "dhiraj"
    tags = {
      env   = "dev"
      owner = "Dhiraj"
    }
  }

  rg2 = {
    name       = "dhirajrg-2"
    location   = "central india"
    managed_by = "dhiraj"
    tags = {
      env   = "dev"
      owner = "Dhiraj"
    }
  }


}


storage_accounts = {
  storage_account1 = {
    name                     = "dhirajsnghstg93049"
    resource_group_name      = "dhirajrg-1"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      env   = "dev"
      owner = "Dhiraj"
    }

  }
}


virtual_networks = {
  vnet-1 = {
    name                = "vnet-1"
    location            = "central india"
    resource_group_name = "dhirajrg-1"
    address_space       = ["10.0.0.1/16"]
    tags = {
      env = "dev"
    owner = "Dhiraj" }

    subnet = {
      subnet1 = {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        name             = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }

      subnet3 = {
        name             = "apgw_subnet"
        address_prefixes = ["10.0.3.0/24"]
      }


    }
  }
}


public_ips = {
  pip-1 = {
    name                = "frontend_public_ip"
    resource_group_name = "dhirajrg-1"
    location            = "central india"
    allocation_method   = "Static"
    tags = {
      env   = "dev"
      owner = "Dhiraj"
    }
  }
}


linux_vmss = {
  vmss1 = {
    name                            = "linux-vmss-01"
    resource_group_name             = "dhirajrg-1"
    location                        = "Central India"
    sku                             = "Standard_DS2_v2"
    instances                       = 2
    admin_username                  = "adminuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false
    virtual_network_name = "vnet-1"
    subnet_name = "subnet1"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

    os_disk = {
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }

    network_interface = {
      nic1 = {
        name    = "vmss-nic-01"
        primary = true

        ip_configuration = {
            name       = "ipconfig-01"
            primary    = true
          }
        }
      }
    }
  }


