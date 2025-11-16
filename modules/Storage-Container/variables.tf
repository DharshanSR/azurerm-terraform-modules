variable "prefix" {
  description = "Prefix for the storage container name"
  type        = string
  default     = "sc"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "project" {
  description = "The project name for resource naming"
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}

variable "container_access_type" {
  description = "The access level configured for this container"
  type        = string
  default     = "private"
  
  validation {
    condition = contains([
      "blob",
      "container", 
      "private"
    ], var.container_access_type)
    error_message = "Container access type must be one of: blob, container, private."
  }
}

variable "metadata" {
  description = "A mapping of metadata to assign to the storage container"
  type        = map(string)
  default     = {}
}