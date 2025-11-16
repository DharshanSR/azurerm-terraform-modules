output "id" {
  description = "The ID of the Storage Account Queue Properties"
  value       = azurerm_storage_account_queue_properties.main.id
}

output "storage_account_id" {
  description = "The ID of the associated storage account"
  value       = azurerm_storage_account_queue_properties.main.storage_account_id
}