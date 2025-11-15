resource "azurerm_application_load_balancer_subnet_association" "application_load_balancer_subnet_association" {
  name                        = var.association_name
  application_load_balancer_id = var.application_load_balancer_id
  subnet_id                   = var.subnet_id
}