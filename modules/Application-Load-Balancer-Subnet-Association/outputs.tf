output "application_load_balancer_subnet_association_id" {
  description = "The ID of the Application Load Balancer Subnet Association"
  value       = azurerm_application_load_balancer_subnet_association.application_load_balancer_subnet_association.id
}

output "application_load_balancer_subnet_association_name" {
  description = "The name of the Application Load Balancer Subnet Association"
  value       = azurerm_application_load_balancer_subnet_association.application_load_balancer_subnet_association.name
}