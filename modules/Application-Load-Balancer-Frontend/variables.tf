variable "frontend_name" {
  description = "Name of the Application Load Balancer Frontend"
  type        = string
}

variable "application_load_balancer_id" {
  description = "ID of the Application Load Balancer"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Application Load Balancer Frontend"
  type        = map(string)
  default     = {}
}