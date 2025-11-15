# Application Load Balancer Frontend Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Application Load Balancer Frontend?

An **Application Load Balancer Frontend** defines the entry point and configuration for incoming traffic to an Azure Application Load Balancer. It specifies the frontend IP configuration, ports, protocols, and domain settings that clients use to connect to the load balancer, enabling traffic distribution to backend pools.

Creates an Application Load Balancer Frontend configuration for traffic entry points.

## Usage

```hcl
module "application_load_balancer_frontend" {
  source = "./modules/Application-Load-Balancer-Frontend"
  
  frontend_name                = "webapp-frontend"
  application_load_balancer_id = module.application_load_balancer.application_load_balancer_id
  
  tags = {
    Environment = "Production"
    Component   = "Frontend"
  }
}
```

## Naming Convention

**Format**: `{name}`

**Example**: `webapp-frontend`