variable "name" {
  description = "Name of the local user"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the Storage Account"
  type        = string
}

variable "home_directory" {
  description = "Home directory of the local user"
  type        = string
  default     = null
}

variable "permission_scopes" {
  description = "List of permission scopes for the local user"
  type = list(object({
    resource_name = string
    service       = string
    permissions = object({
      create = bool
      delete = bool
      list   = bool
      read   = bool
      write  = bool
    })
  }))
  default = null
}

variable "ssh_authorized_keys" {
  description = "List of SSH authorized keys for the local user"
  type = list(object({
    description = string
    key         = string
  }))
  default = null
}