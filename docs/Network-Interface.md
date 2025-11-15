# Network Interface Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Network Interface?

An **Azure Network Interface (NIC)** is a virtual network adapter that connects a virtual machine to a subnet within a Virtual Network. It defines the VM's network configuration including IP addresses, DNS settings, and security groups. Each VM must have at least one NIC, and can have multiple NICs for advanced networking scenarios.

Creates an Azure Network Interface for virtual machine connectivity.

## Usage

```hcl
module "network_interface" {
  source = "./modules/Network-Interface"
  
  network_interface_name = "webapp-vm-nic"
  location              = "East US"
  resource_group_name   = module.resource_group.name
  subnet_id            = module.subnet.subnet_id
  project             = "webapp"
  
  tags = {
    Environment = "Production"
    Tier        = "Web"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `nic-webapp-vm-nic-eastus`

