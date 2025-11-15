resource "azurerm_application_load_balancer_security_policy" "application_load_balancer_security_policy" {
  name                               = var.security_policy_name
  location                          = var.location
  application_load_balancer_id      = var.application_load_balancer_id
  web_application_firewall_policy_id = var.web_application_firewall_policy_id

  tags = var.tags
}