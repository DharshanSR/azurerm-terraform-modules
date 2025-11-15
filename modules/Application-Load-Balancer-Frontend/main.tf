resource "azurerm_application_load_balancer_frontend" "application_load_balancer_frontend" {
  name                         = var.frontend_name
  application_load_balancer_id = var.application_load_balancer_id

  tags = var.tags
}