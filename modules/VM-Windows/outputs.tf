output "id" {
  description = "The ID of the Windows Virtual Machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.id
}

output "virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.virtual_machine_id
}

output "name" {
  description = "The name of the Virtual Machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.name
}

output "private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.private_ip_address
}

output "public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine (if associated)."
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.public_ip_address
}
