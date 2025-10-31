variable "network_security_rule_name" {
  description = "The name of the Network Security Rule"
  type        = string
}

variable "priority" {
  description = "The priority of the rule. The value must be between 100 and 4096"
  type        = number
}

variable "direction" {
  description = "The direction of the rule. Possible values are 'Inbound' or 'Outbound'"
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied. Possible values are 'Allow' or 'Deny'"
  type        = string
}

variable "protocol" {
  description = "The network protocol this rule applies to. Possible values are 'Tcp', 'Udp', 'Icmp', or '*'"
  type        = string
}

variable "source_port_range" {
  description = "The source port or range. Use '*' to allow all"
  type        = string
}

variable "destination_port_range" {
  description = "The destination port or range. Use '*' to allow all"
  type        = string
}

variable "source_address_prefix" {
  description = "The CIDR or source IP range. Use '*' to match any source"
  type        = string
}

variable "destination_address_prefix" {
  description = "The CIDR or destination IP range. Use '*' to match any destination"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group where this rule will be applied"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the Network Security Group"
  type        = string
}
