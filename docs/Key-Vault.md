# Key Vault Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Key Vault?

An **Azure Key Vault** is a cloud service for securely storing and accessing secrets, keys, and certificates. It provides centralized application secret management with granular access policies and audit logging. Key Vault eliminates the need to store sensitive information in application code and supports hardware security modules (HSMs) for additional protection.

Creates an Azure Key Vault with comprehensive security and access control configuration.

## Usage

```hcl
module "key_vault" {
  source = "./modules/Key-Vault"
  
  key_vault_name      = "secrets-kv"
  location           = "East US"
  resource_group_name = module.resource_group.name
  
  sku_name = "standard"
  
  # Security settings
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  purge_protection_enabled        = true
  soft_delete_retention_days      = 90
  
  # Network access controls
  public_network_access_enabled = false
  network_acls = {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = ["203.0.113.0/24"]
    virtual_network_subnet_ids = [module.private_subnet.subnet_id]
  }
  
  tags = {
    Environment = "Production"
    Service     = "Security"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `kv-secrets-kv-eastus`

## Advanced Configuration

```hcl
module "premium_key_vault" {
  source = "./modules/Key-Vault"
  
  key_vault_name      = "premium-kv"
  location           = "East US"
  resource_group_name = module.resource_group.name
  
  sku_name = "premium"  # Enables HSM support
  
  # Enhanced security
  enable_rbac_authorization = true
  purge_protection_enabled  = true
  
  # Certificate contacts
  certificate_contacts = [
    {
      email = "security@company.com"
      name  = "Security Team"
      phone = "+1-555-0123"
    }
  ]
  
  tags = {
    Environment = "Production"
    Compliance  = "SOC2"
  }
}
```

## Integration with Other Modules

```hcl
# Create Key Vault
module "key_vault" {
  source = "./modules/Key-Vault"
  
  key_vault_name      = "app-secrets"
  location           = var.location
  resource_group_name = module.resource_group.name
  sku_name           = "standard"
}

# Grant access to application service principal
module "app_access_policy" {
  source = "./modules/Key-Vault-Access-Policy"
  
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.app_identity.principal_id
  
  secret_permissions = ["Get", "List"]
  key_permissions    = ["Get", "Decrypt", "Encrypt"]
}

# Store application secrets
module "database_connection_string" {
  source = "./modules/Key-Vault-Secret"
  
  secret_name    = "database-connection-string"
  secret_value   = var.database_connection_string
  key_vault_id   = module.key_vault.key_vault_id
  content_type   = "connection-string"
}
```

## Security Best Practices

- **Enable RBAC**: Use `enable_rbac_authorization = true` for fine-grained access control
- **Network Restrictions**: Limit access with `network_acls` configuration
- **Purge Protection**: Enable `purge_protection_enabled = true` for production
- **Soft Delete**: Keep default `soft_delete_retention_days = 90` for recovery
- **Premium SKU**: Use for HSM-backed keys and certificates in high-security environments

## SKU Comparison

| Feature | Standard | Premium |
|---------|----------|---------|
| Software Keys | ✅ | ✅ |
| HSM-backed Keys | ❌ | ✅ |
| Certificates | ✅ | ✅ |
| Secrets | ✅ | ✅ |
| Price | Lower | Higher |