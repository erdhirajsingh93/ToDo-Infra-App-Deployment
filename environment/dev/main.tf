module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups

}

module "storage_accounts" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_storage_accounts"
  storage_accounts = var.storage_accounts

}

module "virtual_networks" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks

}

module "public_ips" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}


module "linux_vmss" {
  depends_on = [module.virtual_networks]
  source     = "../../modules/azurerm_linux_virtual_machine_scale_set"
  linux_vmss = var.linux_vmss


}
