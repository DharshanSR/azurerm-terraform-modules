output "network_security_rule_id" {
  description = "The ID of the Network Security Rule"
  value       = azurerm_network_security_rule.network_security_rule.id
}

output "network_security_rule_name" {
  description = "The name of the Network Security Rule"
  value       = azurerm_network_security_rule.network_security_rule.name
}

output "network_security_rule_priority" {
  description = "The priority assigned to the Network Security Rule"
  value       = azurerm_network_security_rule.network_security_rule.priority
}

output "network_security_rule_direction" {
  description = "The direction of the Network Security Rule (Inbound or Outbound)"
  value       = azurerm_network_security_rule.network_security_rule.direction
}

output "network_security_rule_access" {
  description = "Specifies whether the Network Security Rule allows or denies traffic"
  value       = azurerm_network_security_rule.network_security_rule.access
}

output "network_security_rule_protocol" {
  description = "The network protocol applied by the Network Security Rule"
  value       = azurerm_network_security_rule.network_security_rule.protocol
}
