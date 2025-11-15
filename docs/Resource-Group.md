# Resource Group Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Resource Group?

An **Azure Resource Group** is a logical container that holds related Azure resources for an Azure solution. It acts as a management unit where you can deploy, update, and delete resources collectively. All resources in a resource group share the same lifecycle and are typically managed together.

Creates an Azure Resource Group with standardized naming.

## Usage

```hcl
module "resource_group" {
  source = "./modules/Resource-Group"
  
  resource_group_name = "prod-webapp"
  location           = "East US"
  
  tags = {
    Environment = "Production"
    Project     = "WebApp"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `rg-prod-webapp-eastus`