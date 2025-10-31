resource "azurerm_public_ip" "public_ip" {
  name                    = join("-", [var.public_ip_prefix, var.public_ip_name, var.location])
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  idle_timeout_in_minutes  = var.idle_timeout_in_minutes
  tags                     = var.tags
}