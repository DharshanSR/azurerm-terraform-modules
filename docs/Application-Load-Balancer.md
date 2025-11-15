# Application Load Balancer Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Application Load Balancer?

An **Azure Application Load Balancer** is a Layer 7 (HTTP/HTTPS) load balancing service that distributes incoming application traffic across multiple backend resources. It provides advanced traffic routing capabilities, SSL termination, Web Application Firewall (WAF) protection, and supports both internal and internet-facing scenarios with high availability and scalability.

Creates an Azure Application Load Balancer for Layer 7 traffic distribution and routing.

## Usage

```hcl
module "application_load_balancer" {
  source = "./modules/Application-Load-Balancer"
  
  application_load_balancer_name = "webapp-alb"
  location                      = "East US"
  resource_group_name           = module.resource_group.name
  
  tags = {
    Environment = "Production"
    Service     = "LoadBalancer"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `alb-webapp-eastus`