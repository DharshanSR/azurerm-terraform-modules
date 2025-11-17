output "issuer_id" {
  description = "The ID of the Key Vault Certificate Issuer"
  value       = azurerm_key_vault_certificate_issuer.key_vault_certificate_issuer.id
}

output "issuer_name" {
  description = "The name of the Key Vault Certificate Issuer"
  value       = azurerm_key_vault_certificate_issuer.key_vault_certificate_issuer.name
}

output "provider_name" {
  description = "The name of the third-party Certificate Issuer"
  value       = azurerm_key_vault_certificate_issuer.key_vault_certificate_issuer.provider_name
}