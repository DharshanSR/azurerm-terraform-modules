terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

resource "azurerm_storage_container" "main" {
  name                  = join("-", compact([var.prefix, var.container_name, var.project]))
  storage_account_id    = var.storage_account_id
  container_access_type = var.container_access_type
  metadata              = var.metadata
}