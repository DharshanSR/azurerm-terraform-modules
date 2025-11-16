# Storage Account Static Website Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is Azure Storage Account Static Website?

**Azure Storage Account Static Website** enables your storage account to serve static web content directly from the `$web` container. This cost-effective solution is perfect for hosting static websites, single-page applications (SPAs), and documentation sites with built-in CDN integration and custom domain support.

Configures static website hosting on an Azure Storage Account with custom index and error pages.

## Usage

```hcl
module "storage_static_website" {
  source = "./modules/Storage-Account-Static-Website"
  
  storage_account_id = module.storage_account.id
  
  index_document     = "index.html"
  error_404_document = "404.html"
}
```

## Advanced Configuration

```hcl
module "spa_static_website" {
  source = "./modules/Storage-Account-Static-Website"
  
  storage_account_id = module.storage_account.id
  
  index_document     = "app.html"
  error_404_document = "notfound.html"
}
```

## Static Website URL

After enabling static website hosting, your content will be available at:
- **Primary endpoint**: `https://{storage-account-name}.z13.web.core.windows.net/`
- **Secondary endpoint**: `https://{storage-account-name}-secondary.z13.web.core.windows.net/` (if geo-redundant)

## Requirements

- Storage account must have **account kind** set to `StorageV2` or `BlobStorage`
- Static website content must be uploaded to the `$web` container
- Index and error documents must exist in the `$web` container