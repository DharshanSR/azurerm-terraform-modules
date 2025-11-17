output "certificate_id" {
  description = "The ID of the Key Vault Certificate"
  value       = azurerm_key_vault_certificate.key_vault_certificate.id
}

output "certificate_name" {
  description = "The name of the Key Vault Certificate"
  value       = azurerm_key_vault_certificate.key_vault_certificate.name
}

output "certificate_version" {
  description = "The current version of the Key Vault Certificate"
  value       = azurerm_key_vault_certificate.key_vault_certificate.version
}

output "certificate_version_id" {
  description = "The version ID of the Key Vault Certificate"
  value       = azurerm_key_vault_certificate.key_vault_certificate.versionless_id
}

output "secret_id" {
  description = "The Key Vault Secret ID containing the Certificate data"
  value       = azurerm_key_vault_certificate.key_vault_certificate.secret_id
}

output "certificate_data" {
  description = "The raw Key Vault Certificate data represented as a hexadecimal string"
  value       = azurerm_key_vault_certificate.key_vault_certificate.certificate_data
}

output "certificate_data_base64" {
  description = "The Key Vault Certificate data represented as a base64 string"
  value       = azurerm_key_vault_certificate.key_vault_certificate.certificate_data_base64
}

output "thumbprint" {
  description = "The X509 Thumbprint of the certificate represented as a hexadecimal string"
  value       = azurerm_key_vault_certificate.key_vault_certificate.thumbprint
}