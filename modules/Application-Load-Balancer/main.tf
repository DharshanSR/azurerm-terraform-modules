resource "azurerm_application_load_balancer" "application_load_balancer" {
  name                = join("-", [var.application_load_balancer_prefix, var.application_load_balancer_name, var.location])
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}