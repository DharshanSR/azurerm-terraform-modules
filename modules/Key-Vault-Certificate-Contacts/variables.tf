variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the Certificate Contacts should be configured"
  type        = string
}

variable "contacts" {
  description = "A list of contact information for certificate notifications"
  type = list(object({
    email = string
    name  = string
    phone = string
  }))
}