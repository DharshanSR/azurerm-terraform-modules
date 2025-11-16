variable "storage_container_resource_manager_id" {
  description = "The Resource Manager ID of the storage container to apply the immutability policy to"
  type        = string
}

variable "immutability_period_in_days" {
  description = "The immutability period for the blobs in the container since the policy creation, in days"
  type        = number
}

variable "protected_append_writes_enabled" {
  description = "Whether protected append blobs writes are allowed"
  type        = bool
  default     = false
}

variable "protected_append_writes_all_enabled" {
  description = "Whether protected append blobs writes are allowed on all blobs in the container"
  type        = bool
  default     = false
}