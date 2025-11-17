# Key Vault Access Policy Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is a Key Vault Access Policy?

A **Key Vault Access Policy** defines permissions for a specific user, service principal, or application to access secrets, keys, and certificates in an Azure Key Vault. Access policies provide granular control over what operations each identity can perform, supporting the principle of least privilege for secure secret management.

Creates access policies for Azure Key Vault with granular permission control.

## Usage

```hcl
module "admin_access_policy" {
  source = "./modules/Key-Vault-Access-Policy"
  
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  
  # Full administrative access
  secret_permissions = [
    "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
  ]
  
  key_permissions = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", 
    "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", 
    "Verify", "WrapKey"
  ]
  
  certificate_permissions = [
    "Backup", "Create", "Delete", "Get", "Import", "List", "Purge", 
    "Recover", "Restore", "Update"
  ]
}
```

## Application Access Policy

```hcl
module "app_access_policy" {
  source = "./modules/Key-Vault-Access-Policy"
  
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.app_identity.principal_id
  
  # Read-only access for applications
  secret_permissions = ["Get", "List"]
  key_permissions    = ["Get", "Decrypt", "Encrypt"]
}
```

## Service Principal Access

```hcl
module "service_principal_access_policy" {
  source = "./modules/Key-Vault-Access-Policy"
  
  key_vault_id   = module.key_vault.key_vault_id
  tenant_id      = data.azurerm_client_config.current.tenant_id
  object_id      = azuread_service_principal.automation.object_id
  application_id = azuread_application.automation.application_id
  
  # Automation service permissions
  secret_permissions = ["Get", "Set", "Delete"]
  key_permissions    = ["Get", "Create", "Delete"]
}
```

## Permission Reference

### Secret Permissions
- **Get**: Read secret values
- **List**: List secret names
- **Set**: Create/update secrets
- **Delete**: Delete secrets
- **Backup/Restore**: Export/import secrets
- **Purge**: Permanently delete (cannot be recovered)
- **Recover**: Restore soft-deleted secrets

### Key Permissions
- **Get**: Read key metadata
- **Create**: Generate new keys
- **Decrypt/Encrypt**: Use keys for encryption
- **Sign/Verify**: Use keys for digital signatures
- **WrapKey/UnwrapKey**: Key wrapping operations
- **Import**: Import external keys
- **Backup/Restore**: Export/import keys

### Certificate Permissions
- **Get**: Read certificates
- **List**: List certificate names
- **Create**: Generate certificates
- **Import**: Import certificates
- **Update**: Update certificate properties
- **ManageContacts**: Manage certificate contacts
- **GetIssuers/SetIssuers**: Manage certificate issuers