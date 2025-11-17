resource "azurerm_key_vault_certificate_contacts" "key_vault_certificate_contacts" {
  key_vault_id = var.key_vault_id

  dynamic "contact" {
    for_each = var.contacts
    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }
}