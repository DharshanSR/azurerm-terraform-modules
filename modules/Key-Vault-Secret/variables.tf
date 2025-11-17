variable "secret_name" {
  description = "The name of the Key Vault Secret"
  type        = string
}

variable "secret_value" {
  description = "The value of the Key Vault Secret"
  type        = string
  sensitive   = true
}

variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the Secret should be created"
  type        = string
}

variable "content_type" {
  description = "The content type for the Key Vault Secret"
  type        = string
  default     = null
}

variable "not_before_date" {
  description = "The date before which the Key Vault Secret is not valid"
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "The expiration date of the Key Vault Secret"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault Secret"
  type        = map(string)
  default     = {}
}