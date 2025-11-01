resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                  = join("-", [var.linux_virtual_machine_prefix, var.linux_virtual_machine_name, var.location])
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  network_interface_ids = var.network_interface_ids
  tags                  = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_public_key
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

  # Security Best Practice:
  # Disable password authentication when an SSH key is provided.
  disable_password_authentication = true
}