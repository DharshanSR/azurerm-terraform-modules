terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

resource "azurerm_storage_container_immutability_policy" "main" {
  storage_container_resource_manager_id = var.storage_container_resource_manager_id
  immutability_period_in_days           = var.immutability_period_in_days
  protected_append_writes_enabled       = var.protected_append_writes_enabled
  protected_append_writes_all_enabled   = var.protected_append_writes_all_enabled
}