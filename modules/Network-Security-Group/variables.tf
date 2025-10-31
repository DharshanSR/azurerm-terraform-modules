variable "network_security_group_name" {
  type        = string
  description = "The main name for the Network Security Group"
}

variable "network_security_group_prefix" {
  type        = string
  description = "The prefix for the NSG name."
  default     = "nsg"
}

variable "location" {
  type        = string
  description = "The Azure region where the NSG will be created. This is also used in the name."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group to host the NSG."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the NSG."
  default     = {}
}