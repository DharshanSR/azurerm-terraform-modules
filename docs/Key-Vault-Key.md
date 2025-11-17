# Key Vault Key Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is a Key Vault Key?

A **Key Vault Key** is a cryptographic key stored in Azure Key Vault for encryption, decryption, digital signing, and verification operations. Keys can be software-protected or hardware security module (HSM) protected, supporting various key types including RSA and Elliptic Curve. Key Vault keys enable secure key management with automatic rotation, versioning, and granular access control.

Creates and manages cryptographic keys in Azure Key Vault with comprehensive security features.

## Usage

```hcl
module "encryption_key" {
  source = "./modules/Key-Vault-Key"
  
  key_name     = "data-encryption-key"
  key_vault_id = module.key_vault.key_vault_id
  key_type     = "RSA"
  key_size     = 2048
  
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "verify",
    "wrapKey",
    "unwrapKey"
  ]
  
  tags = {
    Environment = "Production"
    Purpose     = "DataEncryption"
  }
}
```

## HSM-Protected Key (Premium Key Vault)

```hcl
module "hsm_signing_key" {
  source = "./modules/Key-Vault-Key"
  
  key_name     = "document-signing-key"
  key_vault_id = module.premium_key_vault.key_vault_id
  key_type     = "RSA-HSM"  # Hardware-protected
  key_size     = 4096
  
  key_opts = [
    "sign",
    "verify"
  ]
  
  # Set expiration for compliance
  expiration_date = "2025-12-31T23:59:59Z"
  
  tags = {
    Environment = "Production"
    Compliance  = "FIPS-140-2"
  }
}
```

## Elliptic Curve Key

```hcl
module "ec_key" {
  source = "./modules/Key-Vault-Key"
  
  key_name     = "api-signing-key"
  key_vault_id = module.key_vault.key_vault_id
  key_type     = "EC"
  curve        = "P-256"
  
  key_opts = [
    "sign",
    "verify"
  ]
  
  # Automatic rotation policy
  rotation_policy = {
    expire_after         = "P2Y"  # 2 years
    notify_before_expiry = "P30D" # 30 days before expiry
    
    automatic = {
      time_after_creation = "P1Y6M"  # Rotate after 1.5 years
      time_before_expiry  = "P30D"   # Rotate 30 days before expiry
    }
  }
}
```

## Customer-Managed Encryption

```hcl
# Create encryption key for storage account
module "storage_encryption_key" {
  source = "./modules/Key-Vault-Key"
  
  key_name     = "storage-cmk"
  key_vault_id = module.key_vault.key_vault_id
  key_type     = "RSA"
  key_size     = 2048
  
  key_opts = [
    "decrypt",
    "encrypt",
    "wrapKey",
    "unwrapKey"
  ]
}

# Use key for storage account encryption
module "storage_account_cmk" {
  source = "./modules/Storage-Account-Customer-Managed-Key"
  
  storage_account_id        = module.storage_account.storage_account_id
  key_vault_id             = module.key_vault.key_vault_id
  key_name                 = module.storage_encryption_key.key_name
  user_assigned_identity_id = azurerm_user_assigned_identity.storage_identity.id
}
```

## Key Types and Specifications

### RSA Keys
- **Key Sizes**: 2048, 3072, 4096 bits
- **Use Cases**: General encryption, digital signatures
- **Operations**: encrypt, decrypt, sign, verify, wrapKey, unwrapKey

### Elliptic Curve Keys
- **Curves**: P-256, P-256K, P-384, P-521
- **Use Cases**: Digital signatures, lightweight encryption
- **Operations**: sign, verify

### HSM-Protected Keys
- **Types**: RSA-HSM, EC-HSM
- **Security**: FIPS 140-2 Level 2 validated
- **Requirement**: Premium Key Vault SKU

## Key Operations

| Operation | Description | Use Case |
|-----------|-------------|----------|
| `encrypt` | Encrypt plaintext | Data protection |
| `decrypt` | Decrypt ciphertext | Data access |
| `sign` | Create digital signature | Authentication |
| `verify` | Verify digital signature | Validation |
| `wrapKey` | Encrypt another key | Key encryption |
| `unwrapKey` | Decrypt wrapped key | Key access |

## Rotation Policy Configuration

```hcl
rotation_policy = {
  # Expire after 2 years
  expire_after = "P2Y"
  
  # Notify 30 days before expiration
  notify_before_expiry = "P30D"
  
  # Automatic rotation settings
  automatic = {
    # Rotate 18 months after creation
    time_after_creation = "P1Y6M"
    
    # Rotate 30 days before expiry
    time_before_expiry = "P30D"
  }
}
```

## Integration Examples

```hcl
# Certificate signing key
module "cert_signing_key" {
  source = "./modules/Key-Vault-Key"
  
  key_name     = "certificate-authority-key"
  key_vault_id = module.key_vault.key_vault_id
  key_type     = "RSA"
  key_size     = 4096
  
  key_opts = ["sign", "verify"]
}

# Use key in certificate creation
module "ssl_certificate" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "webapp-ssl-cert"
  key_vault_id     = module.key_vault.key_vault_id
  
  # Reference the signing key
  key_properties = {
    exportable = false
    key_size   = 4096
    key_type   = "RSA"
    reuse_key  = true
  }
}
```