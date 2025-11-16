# Storage Account Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Storage Account?

An **Azure Storage Account** is a secure, scalable cloud storage service that provides blob, file, queue, and table storage capabilities. It offers multiple storage tiers (Hot, Cool, Archive), replication options for durability, and advanced security features including encryption, network access controls, and private endpoints for enterprise-grade data protection.

Creates an Azure Storage Account with comprehensive configuration options for storage tiers, security, and networking.

## Usage

```hcl
module "storage_account" {
  source = "./modules/Storage-Account"
  
  storage_account_name     = "webapp"
  resource_group_name      = module.resource_group.name
  location                = "East US"
  project                 = "myproject"
  
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier             = "Hot"
  
  tags = {
    Environment = "Production"
    Service     = "Storage"
  }
}
```

## Naming Convention

**Format**: `{prefix}{name}{project}`

**Example**: `stwebappmyproject` (Storage Account names must be globally unique and lowercase)

## Advanced Configuration

```hcl
module "secure_storage_account" {
  source = "./modules/Storage-Account"
  
  storage_account_name     = "securedata"
  resource_group_name      = module.resource_group.name
  location                = "East US"
  project                 = "prod"
  
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier             = "Cool"
  
  # Security settings
  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = true
  
  tags = {
    Environment = "Production"
    Security    = "High"
  }
}
```

**Note**: For advanced features like network rules, blob properties, queue properties, static website configuration, customer-managed keys, and local users, use the dedicated storage modules:
- `Storage-Account-Network-Rules` - Network access controls
- `Storage-Account-Customer-Managed-Key` - Encryption with your keys
- `Storage-Account-Local-User` - SFTP access configuration
- `Storage-Account-Queue-Properties` - Message queue settings
- `Storage-Account-Static-Website` - Static web hosting
- `Storage-Container` - Blob containers
- `Storage-Container-Immutability-Policy` - Immutable blob storage