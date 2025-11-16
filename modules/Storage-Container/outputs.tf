output "id" {
  description = "The ID of the Storage Container"
  value       = azurerm_storage_container.main.id
}

output "name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.main.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_container.main.storage_account_name
}

output "container_access_type" {
  description = "The access level configured for the container"
  value       = azurerm_storage_container.main.container_access_type
}

output "metadata" {
  description = "The metadata assigned to the storage container"
  value       = azurerm_storage_container.main.metadata
}

output "has_immutability_policy" {
  description = "Is there an immutability policy configured on this storage container"
  value       = azurerm_storage_container.main.has_immutability_policy
}

output "has_legal_hold" {
  description = "Is there a legal hold configured on this storage container"
  value       = azurerm_storage_container.main.has_legal_hold
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this storage container"
  value       = azurerm_storage_container.main.resource_manager_id
}