output "storage_account_local_user_id" {
  description = "The ID of the Storage Account Local User"
  value       = azurerm_storage_account_local_user.storage_account_local_user.id
}

output "name" {
  description = "The name of the Storage Account Local User"
  value       = azurerm_storage_account_local_user.storage_account_local_user.name
}

output "password" {
  description = "The password of the Storage Account Local User"
  value       = azurerm_storage_account_local_user.storage_account_local_user.password
  sensitive   = true
}

output "sid" {
  description = "The SID of the Storage Account Local User"
  value       = azurerm_storage_account_local_user.storage_account_local_user.sid
}