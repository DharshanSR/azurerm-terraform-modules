resource "azurerm_key_vault_certificate" "key_vault_certificate" {
  name         = var.certificate_name
  key_vault_id = var.key_vault_id

  certificate_policy {
    issuer_parameters {
      name = var.issuer_name
    }

    key_properties {
      exportable = var.key_exportable
      key_size   = var.key_size
      key_type   = var.key_type
      reuse_key  = var.reuse_key
    }

    lifetime_action {
      action {
        action_type = var.lifetime_action_type
      }

      trigger {
        days_before_expiry  = var.days_before_expiry
        lifetime_percentage = var.lifetime_percentage
      }
    }

    secret_properties {
      content_type = var.secret_content_type
    }

    x509_certificate_properties {
      extended_key_usage = var.extended_key_usage
      key_usage          = var.key_usage
      subject            = var.subject
      validity_in_months = var.validity_in_months

      dynamic "subject_alternative_names" {
        for_each = var.subject_alternative_names != null ? [var.subject_alternative_names] : []
        content {
          dns_names = subject_alternative_names.value.dns_names
          emails    = subject_alternative_names.value.emails
          upns      = subject_alternative_names.value.upns
        }
      }
    }
  }

  tags = var.tags
}