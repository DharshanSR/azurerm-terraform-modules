variable "key_vault_name" {
  description = "The name for the Key Vault"
  type        = string
}

variable "key_vault_prefix" {
  description = "Prefix for the Key Vault name"
  type        = string
  default     = "kv"
}

variable "location" {
  description = "Azure region where the Key Vault will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the Key Vault will be created"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Defaults to current tenant"
  type        = string
  default     = null
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be either 'standard' or 'premium'."
  }
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault"
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault"
  type        = bool
  default     = false
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault? Defaults to false"
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 days"
  type        = number
  default     = 90
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "The soft_delete_retention_days must be between 7 and 90."
  }
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault"
  type        = bool
  default     = true
}

variable "network_acls" {
  description = "Network access control list for the Key Vault"
  type = object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = null
}

variable "certificate_contacts" {
  description = "Contact information to send notifications triggered by certificate lifetime events"
  type = list(object({
    email = string
    name  = string
    phone = string
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault"
  type        = map(string)
  default     = {}
}