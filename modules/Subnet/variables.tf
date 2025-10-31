variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "The prefix for the Subnet name"
  type        = string
  default     = "snet"
}

variable "resource_group_name" {
  description = "Name of the resource group where the VNet exists"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network this subnet will be added to"
  type        = string
}

variable "address_prefixes" {
  description = "A list of address prefixes to use for the subnet"
  type        = list(string)
}

variable "delegations" {
  description = "A list of delegation blocks for the subnet. Each object must have 'name' and 'service_delegation_name'."
  type = list(object({
    name = string
    service_delegation_name = string
  }))
  default = []
}