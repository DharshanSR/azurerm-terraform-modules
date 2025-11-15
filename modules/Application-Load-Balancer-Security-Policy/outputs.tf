output "application_load_balancer_security_policy_id" {
  description = "The ID of the Application Load Balancer Security Policy"
  value       = azurerm_application_load_balancer_security_policy.application_load_balancer_security_policy.id
}

output "application_load_balancer_security_policy_name" {
  description = "The name of the Application Load Balancer Security Policy"
  value       = azurerm_application_load_balancer_security_policy.application_load_balancer_security_policy.name
}