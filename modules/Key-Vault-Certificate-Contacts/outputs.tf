output "certificate_contacts_id" {
  description = "The ID of the Key Vault Certificate Contacts"
  value       = azurerm_key_vault_certificate_contacts.key_vault_certificate_contacts.id
}

output "key_vault_id" {
  description = "The Key Vault ID"
  value       = azurerm_key_vault_certificate_contacts.key_vault_certificate_contacts.key_vault_id
}