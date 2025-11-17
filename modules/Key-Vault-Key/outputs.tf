output "key_id" {
  description = "The ID of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.id
}

output "key_name" {
  description = "The name of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.name
}

output "key_type" {
  description = "The type of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.key_type
}

output "key_size" {
  description = "The size of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.key_size
}

output "key_version" {
  description = "The current version of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.version
}

output "key_version_id" {
  description = "The version ID of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.versionless_id
}

output "public_key_pem" {
  description = "The PEM encoded public key of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.public_key_pem
}

output "public_key_openssh" {
  description = "The OpenSSH encoded public key of the Key Vault Key"
  value       = azurerm_key_vault_key.key_vault_key.public_key_openssh
}