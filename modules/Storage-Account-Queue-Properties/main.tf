terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

resource "azurerm_storage_account_queue_properties" "main" {
  storage_account_id = var.storage_account_id

  dynamic "cors_rule" {
    for_each = var.cors_rule != null ? [var.cors_rule] : []
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "logging" {
    for_each = var.logging != null ? [var.logging] : []
    content {
      delete                = logging.value.delete
      read                  = logging.value.read
      version               = logging.value.version
      write                 = logging.value.write
      retention_policy_days = logging.value.retention_policy_days
    }
  }

  dynamic "minute_metrics" {
    for_each = var.minute_metrics != null ? [var.minute_metrics] : []
    content {
      version               = minute_metrics.value.version
      include_apis          = minute_metrics.value.include_apis
      retention_policy_days = minute_metrics.value.retention_policy_days
    }
  }

  dynamic "hour_metrics" {
    for_each = var.hour_metrics != null ? [var.hour_metrics] : []
    content {
      version               = hour_metrics.value.version
      include_apis          = hour_metrics.value.include_apis
      retention_policy_days = hour_metrics.value.retention_policy_days
    }
  }
}