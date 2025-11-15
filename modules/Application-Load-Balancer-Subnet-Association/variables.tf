variable "association_name" {
  description = "Name of the Application Load Balancer Subnet Association"
  type        = string
}

variable "application_load_balancer_id" {
  description = "ID of the Application Load Balancer"
  type        = string
}

variable "subnet_id" {
  description = "ID of the Subnet to associate with the Application Load Balancer"
  type        = string
}