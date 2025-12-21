data "azurerm_subnet" "subnetname" {
  for_each             = var.vms
  name                 = each.value.subnet_name1
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pipname" {
  for_each            = var.vms
  name                = each.value.pipname1
  resource_group_name = each.value.resource_group_name
}