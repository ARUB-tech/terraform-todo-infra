module "rg" {
  source                 = "../../module/azurerm_resource_group"
  azurerm_resource_group = var.rg

}
module "vnet" {
  source = "../../module/azurerm_virtual_network"
  vnet   = var.vnet

}


module "pip" {
  depends_on = [module.rg, module.vnet]
  source     = "../../module/azurerm_public_ip"
  public_ips = var.public_ips

}

# module "nic" {
#   depends_on = [module.vnet, module.pip]
#   source     = "../../module/azurerm_network_interface_card"
#   nic_child  = var.nic_child

# }
module "nsgs" {
  depends_on = [
    module.rg,
    module.vnet,
    module.pip
  ]

  source = "../../module/azurerm_network_security_group"
  nsgs   = var.nsgs
}

module "vms" {
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms
  depends_on = [module.rg, module.pip, module.vnet]


}

module "servers" {
  source = "../../module/azurerm_sql_server"
  servers = var.servers
depends_on = [module.rg]

}
module "sqldb" {
  source = "../../module/azurerm_sql_database"
  sqldb = var.sqldb
  depends_on = [module.rg, module.servers]
  
}