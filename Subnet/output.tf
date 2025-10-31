output "subnet_id" {
  description = "The ID of the created Subnet."
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the created Subnet."
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefix(es) for the Subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}

output "subnet_delegations" {
  description = "The delegations configured on the Subnet."
  value       = azurerm_subnet.subnet.delegation
}