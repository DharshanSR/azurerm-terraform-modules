output "access_policy_id" {
  description = "The ID of the Key Vault Access Policy"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.id
}

output "key_vault_id" {
  description = "The Key Vault ID"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.key_vault_id
}

output "tenant_id" {
  description = "The tenant ID"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.tenant_id
}

output "object_id" {
  description = "The object ID"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.object_id
}

output "application_id" {
  description = "The application ID"
  value       = azurerm_key_vault_access_policy.key_vault_access_policy.application_id
}