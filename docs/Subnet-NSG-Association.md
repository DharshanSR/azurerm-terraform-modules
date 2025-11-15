# Subnet NSG Association Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is a Subnet NSG Association?

A **Subnet NSG Association** links a Network Security Group to a specific subnet, applying the NSG's security rules to all resources within that subnet. This association enables centralized network security management at the subnet level, controlling inbound and outbound traffic for all network interfaces in the subnet.

Associates a Network Security Group with a Subnet for network traffic control.

## Usage

```hcl
module "subnet_nsg_association" {
  source = "./modules/Subnet-NSG-Association"
  
  subnet_id                 = module.web_subnet.subnet_id
  network_security_group_id = module.web_nsg.network_security_group_id
}
```

