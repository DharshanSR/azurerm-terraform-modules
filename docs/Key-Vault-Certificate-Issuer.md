# Key Vault Certificate Issuer Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is a Key Vault Certificate Issuer?

A **Key Vault Certificate Issuer** configures integration between Azure Key Vault and certificate authorities (CAs) for automated certificate lifecycle management. It stores CA credentials and configuration, enabling Key Vault to automatically request, renew, and manage certificates from supported certificate authorities without manual intervention.

Configures certificate authority integration for automated certificate management in Azure Key Vault.

## Usage

```hcl
module "digicert_issuer" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name   = "digicert-ca"
  key_vault_id  = module.key_vault.key_vault_id
  provider_name = "DigiCert"
  
  # DigiCert credentials
  account_id = var.digicert_account_id
  password   = var.digicert_api_key
  
  # Organization details
  organization_id = var.digicert_organization_id
  
  tags = {
    Environment = "Production"
    Purpose     = "CertificateManagement"
  }
}
```

## Let's Encrypt ACME Configuration

```hcl
module "letsencrypt_issuer" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name   = "letsencrypt"
  key_vault_id  = module.key_vault.key_vault_id
  provider_name = "LetsEncrypt"
  
  # ACME configuration
  account_id = var.acme_account_email
  
  tags = {
    Environment = "Production"
    CertType    = "DomainValidated"
  }
}
```

## GlobalSign Integration

```hcl
module "globalsign_issuer" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name   = "globalsign-ca"
  key_vault_id  = module.key_vault.key_vault_id
  provider_name = "GlobalSign"
  
  # GlobalSign Atlas credentials
  account_id = var.globalsign_account_id
  password   = var.globalsign_api_key
  
  # Additional configuration
  organization_id = var.globalsign_organization_id
  
  tags = {
    Environment = "Production"
    Vendor      = "GlobalSign"
  }
}
```

## Multiple Certificate Authorities

```hcl
# Production CA for public-facing certificates
module "production_ca" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name   = "prod-digicert"
  key_vault_id  = module.key_vault.key_vault_id
  provider_name = "DigiCert"
  
  account_id      = var.prod_digicert_account
  password        = var.prod_digicert_key
  organization_id = var.company_org_id
}

# Development CA for internal certificates
module "dev_ca" {
  source = "./modules/Key-Vault-Certificate-Issuer"
  
  issuer_name   = "dev-letsencrypt"
  key_vault_id  = module.key_vault.key_vault_id
  provider_name = "LetsEncrypt"
  
  account_id = var.dev_acme_email
}

# Use different issuers for different certificate types
module "public_cert" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "public-api-cert"
  key_vault_id     = module.key_vault.key_vault_id
  issuer_name      = module.production_ca.issuer_name
  
  subject = "CN=api.company.com"
  # ... other configuration
}

module "internal_cert" {
  source = "./modules/Key-Vault-Certificate"
  
  certificate_name = "internal-service-cert"
  key_vault_id     = module.key_vault.key_vault_id
  issuer_name      = module.dev_ca.issuer_name
  
  subject = "CN=internal.company.local"
  # ... other configuration
}
```

## Supported Certificate Authorities

### DigiCert
- **Provider**: `DigiCert`
- **Features**: Extended Validation (EV), Organization Validation (OV), Domain Validation (DV)
- **Requirements**: Account ID, API key, Organization ID
- **Use Cases**: Production public-facing websites, enterprise applications

### Let's Encrypt
- **Provider**: `LetsEncrypt`
- **Features**: Free Domain Validation (DV) certificates, ACME protocol
- **Requirements**: Email address for ACME account
- **Use Cases**: Development, testing, cost-effective production environments

### GlobalSign
- **Provider**: `GlobalSign`
- **Features**: Atlas API integration, various validation levels
- **Requirements**: Account ID, API key, Organization ID
- **Use Cases**: Enterprise certificate management, compliance requirements

## Integration Workflow

1. **Configure Issuer**: Set up CA credentials and configuration
2. **Create Certificate Policy**: Define certificate properties and lifecycle
3. **Automatic Issuance**: Key Vault requests certificate from CA
4. **Lifecycle Management**: Automatic renewal based on policy
5. **Deployment**: Certificates automatically deployed to Azure services

## Security Considerations

- **Credential Protection**: CA credentials stored securely in Key Vault
- **Access Control**: Limit access to certificate issuer configuration
- **Audit Logging**: Monitor certificate issuance and renewal activities
- **Backup Strategy**: Ensure CA configuration is included in backup procedures

## Certificate Authority Comparison

| Feature | DigiCert | Let's Encrypt | GlobalSign |
|---------|----------|---------------|------------|
| **Cost** | Paid | Free | Paid |
| **Validation Types** | DV, OV, EV | DV only | DV, OV, EV |
| **Wildcard Support** | ✅ | ✅ | ✅ |
| **Extended Validation** | ✅ | ❌ | ✅ |
| **Enterprise Support** | ✅ | Community | ✅ |
| **API Integration** | Full | ACME | Full |