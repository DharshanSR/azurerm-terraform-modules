# Application Load Balancer Security Policy Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Application Load Balancer Security Policy?

An **Application Load Balancer Security Policy** associates a Web Application Firewall (WAF) policy with an Azure Application Load Balancer to provide Layer 7 security protection. It enables threat protection, OWASP rule sets, custom rules, and bot protection for web applications behind the load balancer.

Creates an Application Load Balancer Security Policy that associates WAF protection with the load balancer.

## Usage

```hcl
module "application_load_balancer_security_policy" {
  source = "./modules/Application-Load-Balancer-Security-Policy"
  
  security_policy_name               = "webapp-waf-policy"
  location                          = "East US"
  application_load_balancer_id      = module.application_load_balancer.application_load_balancer_id
  web_application_firewall_policy_id = module.waf_policy.waf_policy_id
  
  tags = {
    Environment = "Production"
    Component   = "Security"
  }
}
```

## Naming Convention

**Format**: `{name}`

**Example**: `webapp-waf-policy`