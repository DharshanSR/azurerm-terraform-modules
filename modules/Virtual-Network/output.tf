output "virtual_network_id" {
  description = "The ID of the created Virtual Network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
  description = "The name of the created Virtual Network"
  value       = azurerm_virtual_network.virtual_network.name
}

output "virtual_network_location" {
  description = "The Azure region where the Virtual Network was created"
  value       = azurerm_virtual_network.virtual_network.location
}

output "virtual_network_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.virtual_network.address_space
}

output "virtual_network_resource_group" {
  description = "The resource group where the Virtual Network is created"
  value       = azurerm_virtual_network.virtual_network.resource_group_name
}

output "virtual_network_tags" {
  description = "The tags assigned to the Virtual Network"
  value       = azurerm_virtual_network.virtual_network.tags
}