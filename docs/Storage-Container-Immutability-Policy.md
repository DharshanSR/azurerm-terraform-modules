# Storage Container Immutability Policy Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is Azure Storage Container Immutability Policy?

**Azure Storage Container Immutability Policy** provides WORM (Write Once, Read Many) capabilities for blob storage, ensuring data cannot be modified or deleted for a specified retention period. This is essential for regulatory compliance (SEC 17a-4, CFTC, FINRA), legal holds, and data archival requirements where data integrity and immutability are critical.

Creates an immutability policy for an Azure Storage Container to ensure data retention and compliance.

## Usage

```hcl
module "container_immutability_policy" {
  source = "./modules/Storage-Container-Immutability-Policy"
  
  storage_container_resource_manager_id = module.storage_container.resource_manager_id
  immutability_period_in_days          = 2555  # 7 years for compliance
  
  protected_append_writes_enabled = true
}
```

## Compliance Configuration

```hcl
module "regulatory_compliance_policy" {
  source = "./modules/Storage-Container-Immutability-Policy"
  
  storage_container_resource_manager_id = module.compliance_container.resource_manager_id
  immutability_period_in_days          = 1825  # 5 years
  
  protected_append_writes_enabled     = true
  protected_append_writes_all_enabled = false
}
```

## Common Retention Periods

- **Financial Records**: 2555 days (7 years) - SEC 17a-4(f)
- **Healthcare**: 1825 days (5 years) - HIPAA
- **Legal**: 2190 days (6 years) - Varies by jurisdiction
- **Audit Logs**: 365 days (1 year) - General compliance

## Important Notes

- **Immutable**: Once set, the retention period cannot be shortened
- **Extension Only**: Retention period can only be extended, not reduced
- **Deletion**: Containers cannot be deleted until all blobs exceed retention period
- **Cost Impact**: Consider storage costs for long retention periods