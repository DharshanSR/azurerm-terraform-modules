variable "network_interface_name" {
  description = "The main name for the network interface."
  type        = string
}

variable "network_interface_prefix" {
  description = "A prefix to add to the network interface name, e.g., 'nic'."
  type        = string
  default     = "nic"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy the NIC into."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate the network interface with."
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the primary IP configuration block."
  type        = string
  default     = "primary-ipconfig"
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP. Can be 'Dynamic' or 'Static'."
  type        = string
  default     = "Dynamic"
  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation)
    error_message = "The private_ip_address_allocation must be either 'Dynamic' or 'Static'."
  }
}

variable "private_ip_address" {
  description = "A static private IP address to assign. Only used if allocation is 'Static'."
  type        = string
  default     = null
}

variable "public_ip_address" {
  description = "The ID of the Public IP address to associate with the network interface."
  type        = string
  default     = null
}

variable "ip_forwarding_enabled" {
  description = "Should IP Forwarding be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "accelerated_networking_enabled" {
  description = "Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "dns_servers" {
  description = "A list of IP Addresses defining the DNS Servers which should be used for this Network Interface."
  type        = list(string)
  default     = []
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Network Interface should exist."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}