variable "subnet_id" {
  description = "The ID of the subnet to associate with the Network Security Group"
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the subnet"
  type        = string
}