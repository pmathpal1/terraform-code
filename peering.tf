resource "azurerm_virtual_network_peering" "peering" {
  count                        = length(var.vnet)-1
  name                         = "peering-from-Hub-vnet-to-${element(azurerm_virtual_network.vnet.*.name, count.index + 1)}"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = element(azurerm_virtual_network.vnet.*.name, 0) 
  remote_virtual_network_id    = element(azurerm_virtual_network.vnet.*.id, count.index + 1)
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}



resource "azurerm_virtual_network_peering" "peering1" {
  count                        = length(var.vnet)-1
  name                         = "peering-from-${element(azurerm_virtual_network.vnet.*.name, count.index + 1)}-To-Hub-vnet"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = element(azurerm_virtual_network.vnet.*.name, count.index + 1)
  remote_virtual_network_id    = element(azurerm_virtual_network.vnet.*.id, 0)
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}