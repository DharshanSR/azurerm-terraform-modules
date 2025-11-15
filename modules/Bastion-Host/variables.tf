variable "bastion_host_name" {
  type        = string
  description = "The name for the Bastion Host"
}

variable "bastion_host_prefix" {
  type        = string
  description = "The prefix for the Bastion Host name"
  default     = "bastion"
}

variable "location" {
  type        = string
  description = "The Azure region where the Bastion Host will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Bastion Host will be created"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the AzureBastionSubnet where the Bastion Host will be deployed"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP address to associate with the Bastion Host"
}

variable "bastion_sku" {
  type        = string
  description = "The SKU for the Bastion Host (Basic or Standard)"
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard"], var.bastion_sku)
    error_message = "The bastion_sku must be either 'Basic' or 'Standard'."
  }
}

variable "copy_paste_enabled" {
  type        = bool
  description = "Enable copy/paste feature for the Bastion Host (Standard SKU only)"
  default     = true
}

variable "file_copy_enabled" {
  type        = bool
  description = "Enable file copy feature for the Bastion Host (Standard SKU only)"
  default     = false
}

variable "ip_connect_enabled" {
  type        = bool
  description = "Enable IP connect feature for the Bastion Host (Standard SKU only)"
  default     = false
}

variable "shareable_link_enabled" {
  type        = bool
  description = "Enable shareable link feature for the Bastion Host (Standard SKU only)"
  default     = false
}

variable "tunneling_enabled" {
  type        = bool
  description = "Enable tunneling feature for the Bastion Host (Standard SKU only)"
  default     = false
}

variable "scale_units" {
  type        = number
  description = "The number of scale units for the Bastion Host (2-50, Standard SKU only)"
  default     = 2
  validation {
    condition     = var.scale_units >= 2 && var.scale_units <= 50
    error_message = "The scale_units must be between 2 and 50."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
  default     = {}
}