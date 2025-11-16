output "id" {
  description = "The ID of the Storage Account Static Website"
  value       = azurerm_storage_account_static_website.main.id
}

output "storage_account_id" {
  description = "The ID of the associated storage account"
  value       = azurerm_storage_account_static_website.main.storage_account_id
}

output "index_document" {
  description = "The index document for the static website"
  value       = azurerm_storage_account_static_website.main.index_document
}

output "error_404_document" {
  description = "The 404 error document for the static website"
  value       = azurerm_storage_account_static_website.main.error_404_document
}