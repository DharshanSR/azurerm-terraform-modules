output "application_load_balancer_id" {
  description = "The ID of the Application Load Balancer"
  value       = azurerm_application_load_balancer.application_load_balancer.id
}

output "application_load_balancer_name" {
  description = "The name of the Application Load Balancer"
  value       = azurerm_application_load_balancer.application_load_balancer.name
}

output "application_load_balancer_location" {
  description = "The location of the Application Load Balancer"
  value       = azurerm_application_load_balancer.application_load_balancer.location
}

output "application_load_balancer_resource_group_name" {
  description = "The resource group name of the Application Load Balancer"
  value       = azurerm_application_load_balancer.application_load_balancer.resource_group_name
}