variable "security_policy_name" {
  description = "Name of the Application Load Balancer Security Policy"
  type        = string
}

variable "location" {
  description = "Azure region where the Security Policy will be created"
  type        = string
}

variable "application_load_balancer_id" {
  description = "ID of the Application Load Balancer"
  type        = string
}

variable "web_application_firewall_policy_id" {
  description = "ID of the Web Application Firewall Policy"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Application Load Balancer Security Policy"
  type        = map(string)
  default     = {}
}