# Virtual Network Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Virtual Network?

An **Azure Virtual Network (VNet)** is a representation of your own network in the cloud. It provides network isolation and segmentation, allowing you to control IP address ranges, DNS settings, security policies, and route tables. VNets enable secure communication between Azure resources and can be connected to on-premises networks.

Creates an Azure Virtual Network with custom addressing and DNS configuration.

## Usage

```hcl
module "virtual_network" {
  source = "./modules/Virtual-Network"
  
  virtual_network_name = "prod-webapp-vnet"
  location            = "East US"
  resource_group_name = "rg-prod-eastus"
  address_space       = ["10.0.0.0/16"]
  project            = "webapp"
  
  tags = {
    Environment = "Production"
    Project     = "WebApp"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `vnet-prod-webapp-vnet-eastus`

