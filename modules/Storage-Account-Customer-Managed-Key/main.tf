resource "azurerm_storage_account_customer_managed_key" "storage_account_customer_managed_key" {
  storage_account_id        = var.storage_account_id
  key_vault_id             = var.key_vault_id
  key_name                 = var.key_name
  key_version              = var.key_version
  user_assigned_identity_id = var.user_assigned_identity_id
}