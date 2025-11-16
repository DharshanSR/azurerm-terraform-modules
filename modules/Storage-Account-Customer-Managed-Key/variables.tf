variable "storage_account_id" {
  description = "ID of the Storage Account to configure customer managed key for"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault containing the customer managed key"
  type        = string
}

variable "key_name" {
  description = "Name of the key in the Key Vault"
  type        = string
}

variable "key_version" {
  description = "Version of the key in the Key Vault (optional)"
  type        = string
  default     = null
}

variable "user_assigned_identity_id" {
  description = "ID of the user assigned identity for accessing the Key Vault"
  type        = string
}