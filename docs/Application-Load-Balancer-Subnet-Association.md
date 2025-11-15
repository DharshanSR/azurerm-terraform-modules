# Application Load Balancer Subnet Association Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Application Load Balancer Subnet Association?

An **Application Load Balancer Subnet Association** connects an Azure Application Load Balancer to a specific subnet within a Virtual Network. This association defines where the load balancer's frontend and backend resources are deployed, enabling network connectivity and traffic routing within the designated subnet.

Creates an association between an Application Load Balancer and a subnet for network connectivity.

## Usage

```hcl
module "application_load_balancer_subnet_association" {
  source = "./modules/Application-Load-Balancer-Subnet-Association"
  
  association_name             = "webapp-alb-subnet-association"
  application_load_balancer_id = module.application_load_balancer.application_load_balancer_id
  subnet_id                   = module.subnet.subnet_id
}
```

## Naming Convention

**Format**: `{name}`

**Example**: `webapp-alb-subnet-association`