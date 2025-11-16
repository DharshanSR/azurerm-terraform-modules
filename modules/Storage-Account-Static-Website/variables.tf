variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}

variable "index_document" {
  description = "The webpage that Azure Storage serves for requests to the root of a website"
  type        = string
  default     = "index.html"
}

variable "error_404_document" {
  description = "The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file"
  type        = string
  default     = "404.html"
}