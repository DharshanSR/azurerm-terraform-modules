# Network Security Group Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Network Security Group?

An **Azure Network Security Group (NSG)** contains security rules that allow or deny inbound and outbound network traffic to and from Azure resources. NSGs act as a basic firewall, filtering traffic based on source/destination IP addresses, ports, and protocols. They can be associated with subnets or individual network interfaces.

Creates an Azure Network Security Group for subnet and network interface security.

## Usage

```hcl
module "network_security_group" {
  source = "./modules/Network-Security-Group"
  
  network_security_group_name = "webapp-nsg"
  location                   = "East US"
  resource_group_name        = module.resource_group.name
  project                   = "webapp"
  
  tags = {
    Environment = "Production"
    Tier        = "Web"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `nsg-webapp-nsg-eastus`

