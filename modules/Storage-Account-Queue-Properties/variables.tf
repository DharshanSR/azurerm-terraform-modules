variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}

variable "cors_rule" {
  description = "CORS rule configuration for the queue service"
  type = object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  })
  default = null
}

variable "logging" {
  description = "Logging configuration for the queue service"
  type = object({
    delete                = bool
    read                  = bool
    version               = string
    write                 = bool
    retention_policy_days = optional(number)
  })
  default = null
}

variable "minute_metrics" {
  description = "Minute metrics configuration for the queue service"
  type = object({
    version               = string
    include_apis          = optional(bool)
    retention_policy_days = optional(number)
  })
  default = null
}

variable "hour_metrics" {
  description = "Hour metrics configuration for the queue service"
  type = object({
    version               = string
    include_apis          = optional(bool)
    retention_policy_days = optional(number)
  })
  default = null
}