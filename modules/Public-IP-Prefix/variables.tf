variable "public_ip_prefix_name" {
  description = "The name of the Public IP Prefix resource"
  type        = string
}

variable "location" {
  description = "The Azure region where the Public IP Prefix will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP Prefix"
  type        = string
}

variable "sku" {
  description = "The SKU of the Public IP Prefix. Must be 'Standard'"
  type        = string
  default     = "Standard"
}

variable "ip_version" {
  description = "The IP Version to use, IPv4 or IPv6"
  type        = string
  default     = "IPv4"
}

variable "prefix_length" {
  description = "The number of bits in the prefix. Values: 28 (16 addresses), 29 (8 addresses), 30 (4 addresses), or 31 (2 addresses)"
  type        = number
}

variable "sku_tier" {
  description = "The SKU tier of the Public IP Prefix. Values: 'Regional' or 'Global'"
  type        = string
  default     = "Regional"
}

variable "zones" {
  description = "A list of Availability Zones in which the Public IP Prefix should be created"
  type        = list(string)
  default     = []
}