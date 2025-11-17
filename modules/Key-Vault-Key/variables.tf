variable "key_name" {
  description = "The name of the Key Vault Key"
  type        = string
}

variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the Key should be created"
  type        = string
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created. Possible values are EC (Elliptic Curve), EC-HSM, RSA, RSA-HSM"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_size" {
  description = "The size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM"
  type        = number
  default     = null
}

variable "curve" {
  description = "The curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521"
  type        = string
  default     = null
  validation {
    condition = var.curve == null || contains(["P-256", "P-256K", "P-384", "P-521"], var.curve)
    error_message = "The curve must be one of: P-256, P-256K, P-384, P-521."
  }
}

variable "key_opts" {
  description = "A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify, wrapKey"
  type        = list(string)
  validation {
    condition = alltrue([
      for opt in var.key_opts :
      contains(["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"], opt)
    ])
    error_message = "Invalid key operation specified."
  }
}

variable "not_before_date" {
  description = "The date before which the Key Vault Key is not valid"
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "The expiration date of the Key Vault Key"
  type        = string
  default     = null
}

variable "rotation_policy" {
  description = "The rotation policy for the Key Vault Key"
  type = object({
    expire_after         = string
    notify_before_expiry = string
    automatic = object({
      time_after_creation = string
      time_before_expiry  = string
    })
  })
  default = null
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault Key"
  type        = map(string)
  default     = {}
}