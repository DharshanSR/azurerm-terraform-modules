output "storage_account_customer_managed_key_id" {
  description = "The ID of the Storage Account Customer Managed Key"
  value       = azurerm_storage_account_customer_managed_key.storage_account_customer_managed_key.id
}

output "storage_account_id" {
  description = "The Storage Account ID"
  value       = azurerm_storage_account_customer_managed_key.storage_account_customer_managed_key.storage_account_id
}

output "key_vault_id" {
  description = "The Key Vault ID"
  value       = azurerm_storage_account_customer_managed_key.storage_account_customer_managed_key.key_vault_id
}

output "key_name" {
  description = "The Key name"
  value       = azurerm_storage_account_customer_managed_key.storage_account_customer_managed_key.key_name
}