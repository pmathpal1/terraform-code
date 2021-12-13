resource "azurerm_resource_group" "FirewallRG" {
  name     = var.FirewallRG
  location = var.location
}

resource "azurerm_public_ip" "publicIP" {
  name                = var.publicIPname
  location            = azurerm_resource_group.FirewallRG.location
  resource_group_name = azurerm_resource_group.FirewallRG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "Firewall" {
  name                = var.Firewall
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = "configuration"
    #subnet_id            = "var.subnet[2].subnet_name.id"
    subnet_id            = element(azurerm_subnet.subnets.*.id, 2)
    public_ip_address_id = azurerm_public_ip.publicIP.id
    
  }
  #depends_on           = [azurerm_subnet.subnet]
}