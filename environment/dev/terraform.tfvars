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
        name             = "frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        name             = "backend_subnet"
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
  pip-1={
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
