variable "certificate_name" {
  description = "The name of the Key Vault Certificate"
  type        = string
}

variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the Certificate should be created"
  type        = string
}

variable "issuer_name" {
  description = "The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or the name of the certificate issuer"
  type        = string
  default     = "Self"
}

variable "key_exportable" {
  description = "Is this certificate exportable?"
  type        = bool
  default     = true
}

variable "key_size" {
  description = "The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys"
  type        = number
  default     = 2048
}

variable "key_type" {
  description = "The type of key used in the certificate. Possible values are EC and RSA"
  type        = string
  default     = "RSA"
  validation {
    condition     = contains(["EC", "RSA"], var.key_type)
    error_message = "The key_type must be either 'EC' or 'RSA'."
  }
}

variable "reuse_key" {
  description = "Is the key reusable?"
  type        = bool
  default     = true
}

variable "lifetime_action_type" {
  description = "The action that will be performed. Possible values include AutoRenew and EmailContacts"
  type        = string
  default     = "AutoRenew"
  validation {
    condition     = contains(["AutoRenew", "EmailContacts"], var.lifetime_action_type)
    error_message = "The lifetime_action_type must be either 'AutoRenew' or 'EmailContacts'."
  }
}

variable "days_before_expiry" {
  description = "The number of days before the Certificate expires that the action associated with this Trigger should run"
  type        = number
  default     = 30
}

variable "lifetime_percentage" {
  description = "The percentage at which during the Certificates Lifetime the action associated with this Trigger should run"
  type        = number
  default     = null
}

variable "secret_content_type" {
  description = "The Content-Type of the Certificate, for example application/x-pkcs12 for a PFX or application/x-pem-file for a PEM"
  type        = string
  default     = "application/x-pkcs12"
}

variable "extended_key_usage" {
  description = "A list of Extended/Enhanced Key Usages"
  type        = list(string)
  default     = []
}

variable "key_usage" {
  description = "A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation"
  type        = list(string)
  default     = ["digitalSignature", "keyEncipherment"]
}

variable "subject" {
  description = "The Certificate's Subject"
  type        = string
}

variable "validity_in_months" {
  description = "The Certificates Validity Period in Months"
  type        = number
  default     = 12
}

variable "subject_alternative_names" {
  description = "The Subject Alternative Names of the Certificate"
  type = object({
    dns_names = list(string)
    emails    = list(string)
    upns      = list(string)
  })
  default = null
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault Certificate"
  type        = map(string)
  default     = {}
}