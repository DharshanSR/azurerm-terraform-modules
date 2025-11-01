output "id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.network_interface.id
}

output "name" {
  description = "The name of the Network Interface."
  value       = azurerm_network_interface.network_interface.name
}

output "private_ip_address" {
  description = "The primary private IP address assigned to the NIC."
  value       = azurerm_network_interface.network_interface.private_ip_address
}

output "public_ip_address_id" {
  description = "The ID of the Public IP associated with the Network Interface."
  value       = azurerm_network_interface.network_interface.ip_configuration[0].public_ip_address_id
}

output "mac_address" {
  description = "The MAC address of the Network Interface."
  value       = azurerm_network_interface.network_interface.mac_address
}

output "ip_configuration" {
  description = "The primary IP configuration block."
  value       = azurerm_network_interface.network_interface.ip_configuration
}

output "ip_forwarding_enabled" {
  description = "Indicates if IP forwarding is enabled on this Network Interface."
  value       = azurerm_network_interface.network_interface.ip_forwarding_enabled
}

output "accelerated_networking_enabled" {
  description = "Indicates if accelerated networking is enabled on this Network Interface."
  value       = azurerm_network_interface.network_interface.enable_accelerated_networking
}

output "dns_servers" {
  description = "The DNS servers configured on this Network Interface."
  value       = azurerm_network_interface.network_interface.dns_servers
}

output "edge_zone" {
  description = "The Edge Zone within the Azure Region where this Network Interface exists."
  value       = azurerm_network_interface.network_interface.edge_zone
}