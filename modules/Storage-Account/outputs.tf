output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_location" {
  description = "The location of the Storage Account"
  value       = azurerm_storage_account.storage_account.location
}

output "storage_account_resource_group_name" {
  description = "The resource group name of the Storage Account"
  value       = azurerm_storage_account.storage_account.resource_group_name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "primary_queue_endpoint" {
  description = "The primary queue endpoint of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_queue_endpoint
}

output "primary_table_endpoint" {
  description = "The primary table endpoint of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_table_endpoint
}

output "primary_file_endpoint" {
  description = "The primary file endpoint of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_file_endpoint
}

output "primary_web_endpoint" {
  description = "The primary web endpoint of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}

output "primary_access_key" {
  description = "The primary access key for the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key for the Storage Account"
  value       = azurerm_storage_account.storage_account.secondary_access_key
  sensitive   = true
}

output "primary_connection_string" {
  description = "The primary connection string for the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_connection_string
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The secondary connection string for the Storage Account"
  value       = azurerm_storage_account.storage_account.secondary_connection_string
  sensitive   = true
}