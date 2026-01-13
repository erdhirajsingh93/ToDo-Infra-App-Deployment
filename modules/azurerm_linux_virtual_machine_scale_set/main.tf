resource "azurerm_linux_virtual_machine_scale_set" "linux_vmss" {
    for_each = var.linux_vmss
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  instances           = each.value.instances
  admin_username      = "adminuser"
  admin_password      = "Nokia@802301"
  disable_password_authentication = each.value.disable_password_authentication
 
  
  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
    }
   

  os_disk {
    storage_account_type = each.value.os_disk.storage_account_type
    caching              = each.value.os_disk.caching
    }
    

  dynamic "network_interface" {
    for_each = each.value.network_interface
    content {
    name    = network_interface.value.name
    primary = network_interface.value.primary
   
    ip_configuration {
      name      = network_interface.value.ip_configuration.name
      primary   = network_interface.value.ip_configuration.primary
      subnet_id = data.azurerm_subnet.subnets[each.key].id
        }
      
    }
  }
}

