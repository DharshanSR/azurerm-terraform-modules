output "application_load_balancer_frontend_id" {
  description = "The ID of the Application Load Balancer Frontend"
  value       = azurerm_application_load_balancer_frontend.application_load_balancer_frontend.id
}

output "application_load_balancer_frontend_name" {
  description = "The name of the Application Load Balancer Frontend"
  value       = azurerm_application_load_balancer_frontend.application_load_balancer_frontend.name
}

output "application_load_balancer_frontend_fully_qualified_domain_name" {
  description = "The fully qualified domain name of the Application Load Balancer Frontend"
  value       = azurerm_application_load_balancer_frontend.application_load_balancer_frontend.fully_qualified_domain_name
}