# resource "azurerm_network_interface" "nic" {
#   for_each            = var.nic_child
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   dynamic "ip_configuration" {
#     for_each = each.value.ip_configurations
#     content {
#       name                          = ip_configuration.value.name
#       subnet_id                     = data.azurerm_subnet.subnetid[each.key].id // yaha pr data block use krenge
#       private_ip_address_allocation = "Dynamic"
#       public_ip_address_id          = data.azurerm_public_ip.pipid[each.key].id
#     }
#   }
# }



