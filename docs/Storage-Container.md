# Storage Container Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Storage Container?

An **Azure Storage Container** is a logical unit for organizing blob data within a storage account, similar to a folder or directory. Containers provide access control, metadata storage, and serve as the security boundary for blob operations. They support different access levels (private, blob, container) and can store unlimited amounts of unstructured data.

Creates an Azure Storage Container with configurable access levels and metadata.

## Usage

```hcl
module "storage_container" {
  source = "./modules/Storage-Container"
  
  container_name    = "documents"
  project          = "webapp"
  storage_account_id = module.storage_account.id
  
  container_access_type = "private"
  
  metadata = {
    Environment = "Production"
    Purpose     = "DocumentStorage"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{container_name}-{project}`

**Example**: `sc-documents-webapp`

## Access Levels

- **`private`** (default): No anonymous access
- **`blob`**: Anonymous read access to blobs only  
- **`container`**: Anonymous read access to container and blobs

## Advanced Configuration

```hcl
module "public_assets_container" {
  source = "./modules/Storage-Container"
  
  prefix           = "assets"
  container_name   = "images"
  project         = "ecommerce"
  storage_account_id = module.storage_account.id
  
  container_access_type = "blob"
  
  metadata = {
    ContentType = "Images"
    CDN         = "Enabled"
    CacheControl = "public, max-age=31536000"
  }
}
```