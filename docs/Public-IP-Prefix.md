# Public IP Prefix Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Public IP Prefix?

An **Azure Public IP Prefix** is a reserved range of contiguous public IP addresses in Azure. It allows you to reserve a block of static public IP addresses from the same address range, providing predictable IP addresses for your applications and enabling easier firewall configuration and IP allowlisting.

Creates an Azure Public IP Prefix for reserving a contiguous block of public IP addresses.

## Usage

```hcl
module "public_ip_prefix" {
  source = "./modules/Public-IP-Prefix"
  
  public_ip_prefix_name = "webapp-pip-prefix"
  location             = "East US"
  resource_group_name  = module.resource_group.name
  prefix_length       = 28  # 16 IP addresses
  project            = "webapp"
  
  tags = {
    Environment = "Production"
    Service     = "LoadBalancer"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `ippre-webapp-pip-prefix-eastus`

