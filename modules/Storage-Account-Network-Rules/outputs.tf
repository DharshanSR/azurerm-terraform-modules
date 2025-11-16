output "id" {
  description = "The ID of the Storage Account Network Rules"
  value       = azurerm_storage_account_network_rules.main.id
}

output "storage_account_id" {
  description = "The ID of the associated storage account"
  value       = azurerm_storage_account_network_rules.main.storage_account_id
}

output "default_action" {
  description = "The default action for network rules"
  value       = azurerm_storage_account_network_rules.main.default_action
}

output "bypass" {
  description = "Services that bypass the firewall rules"
  value       = azurerm_storage_account_network_rules.main.bypass
}

output "ip_rules" {
  description = "IP rules configured for the storage account"
  value       = azurerm_storage_account_network_rules.main.ip_rules
}

output "virtual_network_subnet_ids" {
  description = "Virtual network subnet IDs configured for the storage account"
  value       = azurerm_storage_account_network_rules.main.virtual_network_subnet_ids
}