resource "azurerm_key_vault_secret" "key_vault_secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = var.key_vault_id

  content_type = var.content_type
  not_before_date = var.not_before_date
  expiration_date = var.expiration_date

  tags = var.tags
}