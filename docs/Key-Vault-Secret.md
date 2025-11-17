# Key Vault Secret Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is a Key Vault Secret?

A **Key Vault Secret** is encrypted sensitive information stored in Azure Key Vault, such as passwords, connection strings, API keys, or certificates. Secrets are automatically encrypted at rest and in transit, with access controlled through Key Vault access policies. They support versioning, expiration dates, and activation periods for enhanced security management.

Creates and manages secrets in Azure Key Vault with encryption and access control.

## Usage

```hcl
module "database_password" {
  source = "./modules/Key-Vault-Secret"
  
  secret_name    = "database-admin-password"
  secret_value   = var.database_admin_password
  key_vault_id   = module.key_vault.key_vault_id
  
  content_type = "password"
  
  tags = {
    Environment = "Production"
    Purpose     = "Database"
  }
}
```

## Connection String Secret

```hcl
module "storage_connection_string" {
  source = "./modules/Key-Vault-Secret"
  
  secret_name    = "storage-connection-string"
  secret_value   = module.storage_account.primary_connection_string
  key_vault_id   = module.key_vault.key_vault_id
  
  content_type = "connection-string"
  
  # Set expiration for security compliance
  expiration_date = "2024-12-31T23:59:59Z"
}
```

## API Key with Activation Period

```hcl
module "api_key" {
  source = "./modules/Key-Vault-Secret"
  
  secret_name    = "external-api-key"
  secret_value   = var.api_key
  key_vault_id   = module.key_vault.key_vault_id
  
  content_type = "api-key"
  
  # Activate secret in future
  not_before_date = "2024-01-01T00:00:00Z"
  expiration_date = "2024-12-31T23:59:59Z"
  
  tags = {
    Environment = "Production"
    Service     = "ExternalAPI"
  }
}
```

## Multiple Secrets Management

```hcl
# Application configuration secrets
locals {
  app_secrets = {
    "jwt-secret"           = var.jwt_secret
    "encryption-key"       = var.encryption_key
    "smtp-password"        = var.smtp_password
    "external-api-token"   = var.external_api_token
  }
}

module "app_secrets" {
  source = "./modules/Key-Vault-Secret"
  
  for_each = local.app_secrets
  
  secret_name    = each.key
  secret_value   = each.value
  key_vault_id   = module.key_vault.key_vault_id
  
  content_type = "application-secret"
  
  tags = {
    Environment = "Production"
    Application = "WebApp"
  }
}
```

## Integration with Applications

```hcl
# Store database connection details
module "database_secrets" {
  source = "./modules/Key-Vault-Secret"
  
  secret_name    = "database-config"
  secret_value   = jsonencode({
    server   = module.sql_server.fqdn
    database = module.sql_database.name
    username = var.db_admin_username
    password = var.db_admin_password
  })
  key_vault_id = module.key_vault.key_vault_id
  
  content_type = "application/json"
}

# Reference in application deployment
resource "azurerm_linux_web_app" "app" {
  # ... other configuration
  
  app_settings = {
    "DATABASE_CONFIG_SECRET" = module.database_secrets.secret_name
    "KEY_VAULT_URL"         = module.key_vault.key_vault_uri
  }
}
```

## Best Practices

### Secret Naming
- Use consistent naming: `{service}-{purpose}-{type}`
- Examples: `webapp-database-password`, `api-external-token`

### Content Types
- `password` - For passwords and sensitive strings
- `connection-string` - For database/service connections
- `api-key` - For API keys and tokens
- `application/json` - For structured configuration

### Security Considerations
- **Expiration**: Set expiration dates for secrets that should rotate
- **Activation**: Use `not_before_date` for future-active secrets
- **Versioning**: Key Vault automatically versions secrets
- **Access Control**: Limit access through Key Vault access policies

### Rotation Strategy
- Implement automated secret rotation for production environments
- Use expiration dates to force regular updates
- Monitor secret expiration through Azure monitoring