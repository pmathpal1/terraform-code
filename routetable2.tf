resource "azurerm_route_table" "routetablename" {
  count               = length(var.route_table)  #routetable1, 
  name                = var.route_table[count.index]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_route" "route" {
  count               = length(var.route1) #4 route
  name                = var.route1[count.index].name #1-default  2-spoke1tospoke2 3-spoke2tospoke1 4-default
  resource_group_name = azurerm_resource_group.rg.name 
  route_table_name    = var.route1[count.index].routetable #1-routetable1  2-routetable2 3-routetable1 4-routetable2
  address_prefix      = var.route1[count.index].address_prefix  #1-0.0.0.0   2-30.0.0.0/2/4 3-20.0.0.0/24 4-0.0.0.0
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address

}

resource "azurerm_subnet_route_table_association" "Spoke1-Associate" {
  subnet_id      = element(azurerm_subnet.subnets.*.id,1)
  route_table_id = element(azurerm_route_table.routetablename.*.id,0)
}


resource "azurerm_subnet_route_table_association" "Spoke2-Associate" {
  subnet_id      = element(azurerm_subnet.subnets.*.id,0)
  route_table_id = element(azurerm_route_table.routetablename.*.id,1)
}