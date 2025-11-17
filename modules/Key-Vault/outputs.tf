output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.key_vault.id
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.key_vault.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.key_vault.vault_uri
}

output "key_vault_location" {
  description = "The location of the Key Vault"
  value       = azurerm_key_vault.key_vault.location
}

output "key_vault_resource_group_name" {
  description = "The resource group name of the Key Vault"
  value       = azurerm_key_vault.key_vault.resource_group_name
}

output "key_vault_tenant_id" {
  description = "The Azure Active Directory tenant ID used by the Key Vault"
  value       = azurerm_key_vault.key_vault.tenant_id
}

output "key_vault_sku_name" {
  description = "The SKU name of the Key Vault"
  value       = azurerm_key_vault.key_vault.sku_name
}

output "key_vault_tags" {
  description = "The tags assigned to the Key Vault"
  value       = azurerm_key_vault.key_vault.tags
}