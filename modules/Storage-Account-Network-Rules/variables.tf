variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}

variable "default_action" {
  description = "The default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  type        = string
  default     = "Deny"
}

variable "bypass" {
  description = "A list of services that are allowed to bypass the firewall rules"
  type        = list(string)
  default     = ["AzureServices"]
}

variable "ip_rules" {
  description = "A list of public IP or IP ranges in CIDR Format"
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "A list of virtual network subnet ids to secure the storage account"
  type        = list(string)
  default     = []
}

variable "private_link_access" {
  description = "Private link access configuration"
  type = object({
    endpoint_resource_id = string
    endpoint_tenant_id   = optional(string)
  })
  default = null
}