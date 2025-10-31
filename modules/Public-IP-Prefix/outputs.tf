output "id" {
  description = "The ID of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.public_ip_prefix.id
}

output "name" {
  description = "The name of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.public_ip_prefix.name
}

output "ip_prefix" {
  description = "The IP prefix value that was allocated"
  value       = azurerm_public_ip_prefix.public_ip_prefix.ip_prefix
}

output "prefix_length" {
  description = "The length of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.public_ip_prefix.prefix_length
}

output "sku" {
  description = "The SKU of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.public_ip_prefix.sku
}

output "zones" {
  description = "The Availability Zones for the Public IP Prefix"
  value       = azurerm_public_ip_prefix.public_ip_prefix.zones
}
