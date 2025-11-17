output "secret_id" {
  description = "The ID of the Key Vault Secret"
  value       = azurerm_key_vault_secret.key_vault_secret.id
}

output "secret_name" {
  description = "The name of the Key Vault Secret"
  value       = azurerm_key_vault_secret.key_vault_secret.name
}

output "secret_version" {
  description = "The current version of the Key Vault Secret"
  value       = azurerm_key_vault_secret.key_vault_secret.version
}

output "secret_version_id" {
  description = "The version ID of the Key Vault Secret"
  value       = azurerm_key_vault_secret.key_vault_secret.versionless_id
}

output "secret_tags" {
  description = "The tags assigned to the Key Vault Secret"
  value       = azurerm_key_vault_secret.key_vault_secret.tags
}