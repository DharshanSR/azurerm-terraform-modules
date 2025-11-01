resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  location            = var.location
  name                = join("-", ["pipp",var.public_ip_prefix_name])
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  ip_version          = var.ip_version
  prefix_length       = var.prefix_length
  sku_tier            = var.sku_tier
  zones               = var.zones
  tags                = var.tags
}