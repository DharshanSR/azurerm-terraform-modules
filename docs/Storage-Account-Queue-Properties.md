# Storage Account Queue Properties Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is Azure Storage Account Queue Properties?

**Azure Storage Account Queue Properties** configure the queue service settings for your storage account, including CORS rules for cross-origin requests, logging configuration for audit trails, and metrics collection for monitoring queue operations. This enables fine-tuned control over queue service behavior and monitoring capabilities.

Configures queue service properties for an Azure Storage Account including CORS, logging, and metrics settings.

## Usage

```hcl
module "storage_queue_properties" {
  source = "./modules/Storage-Account-Queue-Properties"
  
  storage_account_id = module.storage_account.id
  
  cors_rule = {
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "POST", "PUT"]
    allowed_origins    = ["https://mydomain.com"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }
  
  logging = {
    delete  = true
    read    = true
    version = "1.0"
    write   = true
    retention_policy_days = 30
  }
}
```

## Advanced Configuration

```hcl
module "comprehensive_queue_properties" {
  source = "./modules/Storage-Account-Queue-Properties"
  
  storage_account_id = module.storage_account.id
  
  cors_rule = {
    allowed_headers    = ["x-ms-meta-abc", "x-ms-meta-data*", "x-ms-meta-target*"]
    allowed_methods    = ["GET", "HEAD", "POST", "OPTIONS"]
    allowed_origins    = ["https://app.mydomain.com", "https://admin.mydomain.com"]
    exposed_headers    = ["x-ms-meta-*"]
    max_age_in_seconds = 86400
  }
  
  logging = {
    delete  = true
    read    = false
    version = "2.0"
    write   = true
    retention_policy_days = 90
  }
  
  minute_metrics = {
    version               = "1.0"
    include_apis          = true
    retention_policy_days = 7
  }
  
  hour_metrics = {
    version               = "1.0"
    include_apis          = false
    retention_policy_days = 365
  }
}
```