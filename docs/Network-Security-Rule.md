# Network Security Rule Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Network Security Rule?

An **Azure Network Security Rule** is an individual security policy within a Network Security Group that defines whether traffic should be allowed or denied. Each rule specifies direction (inbound/outbound), priority, protocol, source/destination addresses, and port ranges to control network access to Azure resources.

Creates Network Security Rules within an Azure Network Security Group.

## Usage

```hcl
module "network_security_rule" {
  source = "./modules/Network-Security-Rule"
  
  rule_name                   = "allow-http"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = module.resource_group.name
  network_security_group_name = module.web_nsg.network_security_group_name
}
```

