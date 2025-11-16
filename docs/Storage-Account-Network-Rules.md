# Storage Account Network Rules Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is Azure Storage Account Network Rules?

**Azure Storage Account Network Rules** control network access to your storage account by defining which IP addresses, virtual networks, and Azure services can access the storage. This provides an additional layer of security by allowing you to create firewall rules and restrict access based on network location, helping protect your data from unauthorized access.

Configures network access rules for an Azure Storage Account including IP restrictions, virtual network access, and service bypass options.

## Usage

```hcl
module "storage_network_rules" {
  source = "./modules/Storage-Account-Network-Rules"
  
  storage_account_id = module.storage_account.id
  
  default_action             = "Deny"
  bypass                     = ["AzureServices", "Logging", "Metrics"]
  ip_rules                   = ["203.0.113.0/24", "198.51.100.0/24"]
  virtual_network_subnet_ids = [module.app_subnet.subnet_id, module.db_subnet.subnet_id]
}
```

## Advanced Configuration

```hcl
module "secure_storage_network_rules" {
  source = "./modules/Storage-Account-Network-Rules"
  
  storage_account_id = module.storage_account.id
  
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = ["203.0.113.100/32"]
  virtual_network_subnet_ids = [module.private_subnet.subnet_id]
  
  private_link_access = {
    endpoint_resource_id = "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/rg-private/providers/Microsoft.Storage/storageAccounts/mystorageaccount"
    endpoint_tenant_id   = "12345678-1234-1234-1234-123456789012"
  }
}
```