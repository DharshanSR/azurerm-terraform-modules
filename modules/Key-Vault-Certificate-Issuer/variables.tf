variable "issuer_name" {
  description = "The name of the Key Vault Certificate Issuer"
  type        = string
}

variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the Certificate Issuer should be created"
  type        = string
}

variable "provider_name" {
  description = "The name of the third-party Certificate Issuer. Possible values: DigiCert, GlobalSign, OneCertV2-PublicCA, OneCertV2-PrivateCA, SslAdminV2"
  type        = string
  validation {
    condition = contains([
      "DigiCert", "GlobalSign", "OneCertV2-PublicCA", 
      "OneCertV2-PrivateCA", "SslAdminV2"
    ], var.provider_name)
    error_message = "Invalid provider_name. Must be one of: DigiCert, GlobalSign, OneCertV2-PublicCA, OneCertV2-PrivateCA, SslAdminV2."
  }
}

variable "account_id" {
  description = "The account identifier with the third-party Certificate Issuer"
  type        = string
  default     = null
}

variable "password" {
  description = "The password associated with the account and organization ID"
  type        = string
  default     = null
  sensitive   = true
}



variable "admin_contacts" {
  description = "One or more admin contact blocks for the certificate issuer"
  type = list(object({
    email_address = string
    first_name    = string
    last_name     = string
    phone         = string
  }))
  default = []
}