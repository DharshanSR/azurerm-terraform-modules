# Key Vault Certificate Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is a Key Vault Certificate?

A **Key Vault Certificate** is a TLS/SSL certificate stored in Azure Key Vault with automated lifecycle management. It supports certificate generation, renewal, and integration with Azure services. Key Vault certificates can be issued by supported certificate authorities or imported from external sources, providing centralized certificate management with automatic deployment to Azure resources.

Creates and manages SSL/TLS certificates in Azure Key Vault with automated lifecycle management.

## Usage

```hcl
module "ssl_certificate" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "webapp-ssl-cert"
  key_vault_id     = module.key_vault.key_vault_id
  
  # Certificate properties
  issuer_name        = "Self"
  subject           = "CN=webapp.company.com"
  validity_in_months = 12
  
  # Key properties
  key_exportable = false
  key_size      = 2048
  key_type      = "RSA"
  reuse_key     = true
  
  # Certificate usage
  key_usage = [
    "digitalSignature",
    "keyEncipherment"
  ]
  
  extended_key_usage = [
    "1.3.6.1.5.5.7.3.1", # Server Authentication
    "1.3.6.1.5.5.7.3.2"  # Client Authentication
  ]
  
  # Subject Alternative Names
  subject_alternative_names = {
    dns_names = [
      "webapp.company.com",
      "www.webapp.company.com"
    ]
    emails = ["admin@company.com"]
    upns   = []
  }
  
  # Automatic renewal
  lifetime_action_type = "AutoRenew"
  days_before_expiry   = 30
  
  tags = {
    Environment = "Production"
    Service     = "WebApp"
  }
}
```

## Integration with Certificate Authority

```hcl
# First, configure certificate issuer
module "cert_issuer" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name  = "digicert"
  key_vault_id = module.key_vault.key_vault_id
  provider_name = "DigiCert"
  
  account_id = var.digicert_account_id
  password   = var.digicert_password
}

# Then create certificate with CA issuer
module "ca_certificate" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "production-ssl-cert"
  key_vault_id     = module.key_vault.key_vault_id
  
  # Use configured certificate authority
  issuer_name = module.cert_issuer.issuer_name
  
  subject           = "CN=api.company.com"
  validity_in_months = 24
  
  subject_alternative_names = {
    dns_names = [
      "api.company.com",
      "*.api.company.com"
    ]
  }
  
  # Production certificate settings
  key_exportable = false
  key_size      = 4096
  key_type      = "RSA"
  
  depends_on = [module.cert_issuer]
}
```

## Self-Signed Development Certificate

```hcl
module "dev_certificate" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "dev-ssl-cert"
  key_vault_id     = module.key_vault.key_vault_id
  
  # Self-signed for development
  issuer_name        = "Self"
  subject           = "CN=localhost"
  validity_in_months = 12
  
  subject_alternative_names = {
    dns_names = [
      "localhost",
      "127.0.0.1",
      "dev.local"
    ]
  }
  
  key_exportable = true  # Allow export for development
  key_size      = 2048
  key_type      = "RSA"
  
  tags = {
    Environment = "Development"
  }
}
```

## Certificate Lifecycle Management

```hcl
module "managed_certificate" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "managed-ssl-cert"
  key_vault_id     = module.key_vault.key_vault_id
  
  issuer_name = "DigiCert"
  subject    = "CN=secure.company.com"
  
  # Automatic renewal configuration
  lifetime_action_type = "AutoRenew"
  days_before_expiry   = 30
  lifetime_percentage  = 80  # Renew at 80% of lifetime
  
  # Extended validation settings
  validity_in_months = 12
  key_size          = 4096
  key_exportable    = false
  
  extended_key_usage = [
    "1.3.6.1.5.5.7.3.1"  # Server Authentication
  ]
  
  key_usage = [
    "digitalSignature",
    "keyEncipherment",
    "nonRepudiation"
  ]
}
```

## Supported Certificate Authorities

- **Self**: Self-signed certificates (development/testing)
- **DigiCert**: Enterprise CA with EV support
- **GlobalSign**: Global certificate authority
- **Let's Encrypt**: Free automated certificates (via ACME)

## Certificate Properties

### Key Types
- **RSA**: 2048, 3072, 4096 bit keys
- **EC**: P-256, P-384, P-521 curves

### Key Usage Options
- `digitalSignature` - Digital signatures
- `keyEncipherment` - Key encryption
- `nonRepudiation` - Non-repudiation
- `dataEncipherment` - Data encryption
- `keyAgreement` - Key agreement

### Extended Key Usage
- `1.3.6.1.5.5.7.3.1` - Server Authentication (TLS Web Server)
- `1.3.6.1.5.5.7.3.2` - Client Authentication (TLS Web Client)
- `1.3.6.1.5.5.7.3.3` - Code Signing
- `1.3.6.1.5.5.7.3.4` - Email Protection