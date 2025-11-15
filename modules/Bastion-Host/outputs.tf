output "id" {
  description = "The ID of the Bastion Host"
  value       = azurerm_bastion_host.bastion_host.id
}

output "name" {
  description = "The name of the Bastion Host"
  value       = azurerm_bastion_host.bastion_host.name
}

output "dns_name" {
  description = "The FQDN of the Bastion Host"
  value       = azurerm_bastion_host.bastion_host.dns_name
}