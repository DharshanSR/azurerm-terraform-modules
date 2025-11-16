terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

resource "azurerm_storage_account_static_website" "main" {
  storage_account_id = var.storage_account_id
  
  index_document     = var.index_document
  error_404_document = var.error_404_document
}