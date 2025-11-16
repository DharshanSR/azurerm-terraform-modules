output "id" {
  description = "The ID of the Storage Container Immutability Policy"
  value       = azurerm_storage_container_immutability_policy.main.id
}

output "storage_container_resource_manager_id" {
  description = "The Resource Manager ID of the storage container"
  value       = azurerm_storage_container_immutability_policy.main.storage_container_resource_manager_id
}

output "immutability_period_in_days" {
  description = "The immutability period in days"
  value       = azurerm_storage_container_immutability_policy.main.immutability_period_in_days
}

output "protected_append_writes_enabled" {
  description = "Whether protected append writes are enabled"
  value       = azurerm_storage_container_immutability_policy.main.protected_append_writes_enabled
}

output "protected_append_writes_all_enabled" {
  description = "Whether protected append writes are enabled for all blobs"
  value       = azurerm_storage_container_immutability_policy.main.protected_append_writes_all_enabled
}