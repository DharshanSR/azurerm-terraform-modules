# Bastion Host Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Bastion Host?

An **Azure Bastion Host** is a fully managed PaaS service that provides secure and seamless RDP and SSH connectivity to virtual machines directly through the Azure portal over TLS. It eliminates the need for public IP addresses on VMs while providing protection against port scanning and other malicious attacks from the public internet.

Creates an Azure Bastion Host for secure RDP/SSH access to VMs.

## Usage

```hcl
module "bastion_host" {
  source = "./modules/Bastion-Host"
  
  bastion_host_name   = "prod-bastion"
  location           = "East US"
  resource_group_name = module.resource_group.name
  subnet_id          = module.bastion_subnet.subnet_id
  public_ip_id       = module.bastion_pip.id
  
  bastion_sku = "Standard"
  
  tags = {
    Environment = "Production"
  }
}
```

## Requirements

- **AzureBastionSubnet**: Must exist with /26 or larger CIDR
- **Public IP**: Standard SKU with Static allocation required
- **Standard SKU features**: Only available with Standard SKU (copy/paste, file transfer, tunneling, etc.)

## SKU Comparison

| Feature | Basic | Standard |
|---------|-------|----------|
| Sessions | 25 max | 50 max (scalable) |
| Copy/Paste | ❌ | ✅ |
| File Transfer | ❌ | ✅ |
| Tunneling | ❌ | ✅ |