variable "public_ip_name" {
  description = "The name of the Public IP address resource. Will be combined with prefix and location."
  type        = string
}

variable "location" {
  description = "The Azure region where the Public IP address will be created (e.g., 'East US', 'West Europe')."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the Public IP address resource for better resource management."
  type        = map(string)
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP address resource."
  type        = string
}

variable "sku" {
  default     = "Standard"
  description = "The SKU of the Public IP address. Options are 'Standard' (recommended for production) or 'Basic'."
  type        = string
}

variable "idle_timeout_in_minutes" {
  default     = "4"
  description = "The idle timeout in minutes for the TCP reset on the Public IP address. Value between 4 and 30 minutes."
  type        = string
}

variable "ip_version" {
  default     = "IPv4"
  description = "Version of IP to be used. Options are 'IPv4' or 'IPv6'. Most common is IPv4."
  type        = string
}

variable "allocation_method" {
  default     = "Static"
  description = "Defines how the Public IP address is assigned. 'Static' is recommended for production. Options: 'Static' or 'Dynamic'."
  type        = string
}

variable "public_ip_prefix" {
  description = "The prefix used in naming convention for the Public IP address resource. Default is 'pip' for public IP."
  type        = string
  default     = "pip"
}