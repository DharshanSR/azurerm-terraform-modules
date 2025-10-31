resource "azurerm_virtual_network" "virtual_network" {
  name                = join("-", [var.virtual_network_prefix, var.virtual_network_name, var.location])
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}