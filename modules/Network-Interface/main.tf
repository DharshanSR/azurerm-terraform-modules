resource "azurerm_network_interface" "network_interface" {
  name                = join("-", [var.network_interface_prefix, var.network_interface_name, var.location])
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_forwarding_enabled         = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.public_ip_address
  }

  tags = var.tags
}
