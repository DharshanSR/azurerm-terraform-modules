# Subnet Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Subnet?

An **Azure Subnet** is a segmented portion of a Virtual Network with its own IP address range. Subnets enable you to organize and secure resources by grouping them into separate network segments. Each subnet can have different security rules, route tables, and can be associated with different Azure services.

Creates subnets within an Azure Virtual Network for network segmentation.

## Usage

```hcl
module "subnet" {
  source = "./modules/Subnet"
  
  subnet_name          = "webapp-subnet"
  virtual_network_name = module.virtual_network.virtual_network_name
  resource_group_name  = module.resource_group.name
  address_prefixes     = ["10.0.1.0/24"]
  
  tags = {
    Environment = "Production"
    Tier        = "Web"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{vnet_name}`

**Example**: `snet-webapp-subnet-prod-vnet`

