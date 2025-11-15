resource "azurerm_bastion_host" "bastion_host" {
  name                   = join("-", [var.bastion_host_prefix, var.bastion_host_name, var.location])
  location              = var.location
  resource_group_name   = var.resource_group_name
  sku                   = var.bastion_sku
  copy_paste_enabled    = var.bastion_sku == "Standard" ? var.copy_paste_enabled : null
  file_copy_enabled     = var.bastion_sku == "Standard" ? var.file_copy_enabled : null
  ip_connect_enabled    = var.bastion_sku == "Standard" ? var.ip_connect_enabled : null
  shareable_link_enabled = var.bastion_sku == "Standard" ? var.shareable_link_enabled : null
  tunneling_enabled     = var.bastion_sku == "Standard" ? var.tunneling_enabled : null
  scale_units          = var.bastion_sku == "Standard" ? var.scale_units : null

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }

  tags = var.tags
}