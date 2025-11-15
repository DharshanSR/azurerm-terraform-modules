variable "application_load_balancer_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "application_load_balancer_prefix" {
  description = "Prefix for the Application Load Balancer name"
  type        = string
  default     = "alb"
}

variable "location" {
  description = "Azure region where the Application Load Balancer will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the Application Load Balancer will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Application Load Balancer"
  type        = map(string)
  default     = {}
}