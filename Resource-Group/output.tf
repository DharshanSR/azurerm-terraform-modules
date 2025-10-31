output "id" {
  description = "The fully qualified ID of the resource group."
  value       = azurerm_resource_group.this.id
}

output "name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.this.location
}

output "tags" {
  description = "The tags assigned to the resource group."
  value       = azurerm_resource_group.this.tags
}
