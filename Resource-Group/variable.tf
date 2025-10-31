variable resource_group_name {
  description = "The name of the resource group"
  type        = string
  default     = "rg"
}

variable location {
  description = "The location of the resource group"
  type        = string
}

variable tags {
  description = "Tags to assign to the resource group"
  type        = map(string)
  default     = {}
}
