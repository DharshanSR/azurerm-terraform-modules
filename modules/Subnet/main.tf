resource "azurerm_subnet" "subnet" {
  name                 = join("-", [var.subnet_prefix, var.subnet_name])
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  # --- Dynamic block for delegation ---
  dynamic "delegation" {
    for_each = var.delegations

    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation_name
        actions = []
      }
    }
  }
}