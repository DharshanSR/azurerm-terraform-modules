variable "virtual_network_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "virtual_network_prefix" {
  description = "The prefix for the Virtual Network name"
  type        = string
  default     = "vnet"
}

variable "location" {
  description = "Azure region where the Virtual Network will be created"
  type        = string
}

variable "project" {
  description = "Project name for tagging and naming"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group where the Virtual Network will be created"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the Virtual Network"
  type        = map(string)
  default     = {}
}