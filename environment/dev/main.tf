module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups

}

module "storage_accounts" {
  source           = "../../modules/azurerm_storage_accounts"
  storage_accounts = var.storage_accounts

}

module "virtual_networks" {
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks

}

module "public_ips" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}
