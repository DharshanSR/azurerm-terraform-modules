# Public IP Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Public IP?

An **Azure Public IP Address** is a reserved, static or dynamic IP address that provides internet connectivity to Azure resources. It enables inbound connectivity from the internet and outbound connectivity without network address translation (NAT). Public IPs can be associated with load balancers, VMs, gateways, and other Azure services.

Creates an Azure Public IP address for load balancers, VMs, and gateways.

## Usage

```hcl
module "public_ip" {
  source = "./modules/Public-IP"
  
  public_ip_name      = "webapp-pip"
  location           = "East US"
  resource_group_name = module.resource_group.name
  project           = "webapp"
  
  tags = {
    Environment = "Production"
    Service     = "LoadBalancer"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `pip-webapp-pip-eastus`

