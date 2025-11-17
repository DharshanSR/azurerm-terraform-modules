resource "azurerm_key_vault_certificate_issuer" "key_vault_certificate_issuer" {
  name         = var.issuer_name
  key_vault_id = var.key_vault_id
  provider_name = var.provider_name

  account_id = var.account_id
  password   = var.password

  dynamic "admin" {
    for_each = var.admin_contacts
    content {
      email_address = admin.value.email_address
      first_name    = admin.value.first_name
      last_name     = admin.value.last_name
      phone         = admin.value.phone
    }
  }
}