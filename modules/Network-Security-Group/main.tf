resource "azurerm_network_security_group" "network_security_group" {
  name                = join("-", [var.network_security_group_prefix, var.network_security_group_name, var.location])
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "network_security_group_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}