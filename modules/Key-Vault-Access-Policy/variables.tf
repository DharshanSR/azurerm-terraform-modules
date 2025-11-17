variable "key_vault_id" {
  description = "The resource ID of the Key Vault for which the access policy is being set"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
  type        = string
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault"
  type        = string
}

variable "application_id" {
  description = "The object ID of an Application in Azure Active Directory"
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "List of certificate permissions. Must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers, Update"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.certificate_permissions :
      contains([
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", 
        "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", 
        "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ], perm)
    ])
    error_message = "Invalid certificate permission specified."
  }
}

variable "key_permissions" {
  description = "List of key permissions. Must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, SetRotationPolicy"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.key_permissions :
      contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", 
        "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", 
        "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
      ], perm)
    ])
    error_message = "Invalid key permission specified."
  }
}

variable "secret_permissions" {
  description = "List of secret permissions. Must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore, Set"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.secret_permissions :
      contains([
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ], perm)
    ])
    error_message = "Invalid secret permission specified."
  }
}

variable "storage_permissions" {
  description = "List of storage permissions. Must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS, Update"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.storage_permissions :
      contains([
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", 
        "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
      ], perm)
    ])
    error_message = "Invalid storage permission specified."
  }
}