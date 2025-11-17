# Azure Resource Manager Terraform Modules

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> **Enterprise-grade Terraform modules for Azure Resource Manager (ARM) infrastructure provisioning**

This repository provides a comprehensive collection of production-ready, reusable Terraform modules designed for Azure cloud infrastructure. Each module follows industry best practices, ensuring consistency, security, and maintainability across your Infrastructure as Code (IaC) implementations.

## 📦 Available Modules

### Core Infrastructure

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|--------------|
| **[Resource-Group](./modules/Resource-Group)** | `azurerm_resource_group` | Foundation resource group with standardized naming | [📖 Docs](./docs/Resource-Group.md) |
| **[Virtual-Network](./modules/Virtual-Network)** | `azurerm_virtual_network` | Enterprise VNet with customizable address spaces | [📖 Docs](./docs/Virtual-Network.md) |
| **[Subnet](./modules/Subnet)** | `azurerm_subnet` | Flexible subnet configuration with delegation support | [📖 Docs](./docs/Subnet.md) |

### Security & Access

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|--------------|
| **[Network-Security-Group](./modules/Network-Security-Group)** | `azurerm_network_security_group` | NSG with standardized security configurations | [📖 Docs](./docs/Network-Security-Group.md) |
| **[Network-Security-Rule](./modules/Network-Security-Rule)** | `azurerm_network_security_rule` | Granular security rule management | [📖 Docs](./docs/Network-Security-Rule.md) |
| **[Bastion-Host](./modules/Bastion-Host)** | `azurerm_bastion_host` | Secure RDP/SSH access with Standard/Basic SKU support | [📖 Docs](./docs/Bastion-Host.md) |

### Networking & Connectivity

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|--------------|
| **[Public-IP](./modules/Public-IP)** | `azurerm_public_ip` | Static/Dynamic public IP with Standard/Basic SKU | [📖 Docs](./docs/Public-IP.md) |
| **[Public-IP-Prefix](./modules/Public-IP-Prefix)** | `azurerm_public_ip_prefix` | Reserved public IP ranges for predictable addressing | [📖 Docs](./docs/Public-IP-Prefix.md) |
| **[Network-Interface](./modules/Network-Interface)** | `azurerm_network_interface` | VM network interface with IP configuration options | [📖 Docs](./docs/Network-Interface.md) |
| **[Subnet-NSG-Association](./modules/Subnet-NSG-Association)** | `azurerm_subnet_network_security_group_association` | Secure subnet-NSG binding | [📖 Docs](./docs/Subnet-NSG-Association.md) |

### Load Balancing & Traffic Management

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|---------------|
| **[Application-Load-Balancer](./modules/Application-Load-Balancer)** | `azurerm_application_load_balancer` | Layer 7 load balancer for HTTP/HTTPS traffic distribution | [📖 Docs](./docs/Application-Load-Balancer.md) |
| **[Application-Load-Balancer-Frontend](./modules/Application-Load-Balancer-Frontend)** | `azurerm_application_load_balancer_frontend` | Frontend configuration for Application Load Balancer | [📖 Docs](./docs/Application-Load-Balancer-Frontend.md) |
| **[Application-Load-Balancer-Security-Policy](./modules/Application-Load-Balancer-Security-Policy)** | `azurerm_application_load_balancer_security_policy` | WAF security policy attachment for Application Load Balancer | [📖 Docs](./docs/Application-Load-Balancer-Security-Policy.md) |
| **[Application-Load-Balancer-Subnet-Association](./modules/Application-Load-Balancer-Subnet-Association)** | `azurerm_application_load_balancer_subnet_association` | Subnet association for Application Load Balancer | [📖 Docs](./docs/Application-Load-Balancer-Subnet-Association.md) |

### Compute Resources

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|--------------|
| **[VM-Linux](./modules/VM-Linux)** | `azurerm_linux_virtual_machine` | Enterprise Linux VMs with customizable configurations | [📖 Docs](./docs/VM-Linux.md) |

### Security & Identity Management

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|---------------|
| **[Key-Vault](./modules/Key-Vault)** | `azurerm_key_vault` | Centralized secrets, keys, and certificate management | [📖 Docs](./docs/Key-Vault.md) |
| **[Key-Vault-Access-Policy](./modules/Key-Vault-Access-Policy)** | `azurerm_key_vault_access_policy` | Granular access control for Key Vault resources | [📖 Docs](./docs/Key-Vault-Access-Policy.md) |
| **[Key-Vault-Secret](./modules/Key-Vault-Secret)** | `azurerm_key_vault_secret` | Secure storage for passwords, connection strings, and API keys | [📖 Docs](./docs/Key-Vault-Secret.md) |
| **[Key-Vault-Key](./modules/Key-Vault-Key)** | `azurerm_key_vault_key` | Cryptographic keys for encryption, signing, and verification | [📖 Docs](./docs/Key-Vault-Key.md) |
| **[Key-Vault-Certificate](./modules/Key-Vault-Certificate)** | `azurerm_key_vault_certificate` | SSL/TLS certificates with automated management | [📖 Docs](./docs/Key-Vault-Certificate.md) |
| **[Key-Vault-Certificate-Contacts](./modules/Key-Vault-Certificate-Contacts)** | `azurerm_key_vault_certificate_contacts` | Certificate lifecycle notification contacts | [📖 Docs](./docs/Key-Vault-Certificate-Contacts.md) |
| **[Key-Vault-Certificate-Issuer](./modules/Key-Vault-Certificate-Issuer)** | `azurerm_key_vault_certificate_issuer` | Certificate authority integration for automated certificate issuance | [📖 Docs](./docs/Key-Vault-Certificate-Issuer.md) |

### Storage & Data

| Module | Azure Resource | Description | Documentation |
|--------|----------------|-------------|---------------|
| **[Storage-Account](./modules/Storage-Account)** | `azurerm_storage_account` | Scalable cloud storage with multiple tiers and security features | [📖 Docs](./docs/Storage-Account.md) |
| **[Storage-Account-Customer-Managed-Key](./modules/Storage-Account-Customer-Managed-Key)** | `azurerm_storage_account_customer_managed_key` | Customer-managed encryption keys for enhanced security | [📖 Docs](./docs/Storage-Account-Customer-Managed-Key.md) |
| **[Storage-Account-Local-User](./modules/Storage-Account-Local-User)** | `azurerm_storage_account_local_user` | SFTP access configuration with SSH key management | [📖 Docs](./docs/Storage-Account-Local-User.md) |
| **[Storage-Account-Network-Rules](./modules/Storage-Account-Network-Rules)** | `azurerm_storage_account_network_rules` | Network access controls and firewall rules | [📖 Docs](./docs/Storage-Account-Network-Rules.md) |
| **[Storage-Account-Queue-Properties](./modules/Storage-Account-Queue-Properties)** | `azurerm_storage_account_queue_properties` | Queue service configuration with CORS and metrics | [📖 Docs](./docs/Storage-Account-Queue-Properties.md) |
| **[Storage-Account-Static-Website](./modules/Storage-Account-Static-Website)** | `azurerm_storage_account_static_website` | Static website hosting configuration | [📖 Docs](./docs/Storage-Account-Static-Website.md) |
| **[Storage-Container](./modules/Storage-Container)** | `azurerm_storage_container` | Blob storage containers with access control | [📖 Docs](./docs/Storage-Container.md) |
| **[Storage-Container-Immutability-Policy](./modules/Storage-Container-Immutability-Policy)** | `azurerm_storage_container_immutability_policy` | WORM compliance and data retention policies | [📖 Docs](./docs/Storage-Container-Immutability-Policy.md) |


## 🏗️ Module Architecture

### Standard Module Structure
```
modules/{module-name}/
├── main.tf           # Primary resource definitions
├── variables.tf      # Input variable declarations
├── outputs.tf        # Output value definitions
```

### Common Variables & Standards

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `location` | `string` | Azure region identifier | `"East US"`, `"West Europe"` |
| `resource_group_name` | `string` | Target resource group | `"prod-app-rg"` |
| `tags` | `map(string)` | Resource metadata tags | `{ Environment = "prod" }` |

### Naming Convention Standards

Our modules implement consistent naming patterns:

```hcl
# Pattern: {prefix}-{name}-{location}
# Examples:
"rg-webapp-eastus"           # Resource Group
"vnet-webapp-eastus"         # Virtual Network  
"nsg-webapp-frontend-eastus" # Network Security Group
```

**Naming Components:**
- **Prefix**: Azure resource abbreviation ([Microsoft Standards](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations))
- **Name**: Descriptive resource identifier
- **Location**: Azure region (auto-converted to abbreviation)

## 📋 Prerequisites & Requirements

### System Requirements

| Component | Version | Purpose |
|-----------|---------|---------|
| **Terraform** | `>= 1.0` | Infrastructure provisioning engine |
| **Azure CLI** | `>= 2.30.0` | Azure authentication & management |
| **AzureRM Provider** | `~> 3.0` | Azure resource management |

### Azure Prerequisites

- **Active Azure Subscription** with appropriate permissions
- **Service Principal** or **Managed Identity** with Contributor access
- **Resource quotas** sufficient for planned deployments

### Development Environment Setup

#### 1. Install Required Tools (if not already installed)

- **Terraform**: https://www.terraform.io/downloads
- **Azure CLI**: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

#### 2. Clone Repository

```bash
git clone https://github.com/your-org/azurerm-terraform-modules.git
cd azurerm-terraform-modules
```

#### 3. Configure Azure Authentication

```bash
az login
az account set --subscription "your-subscription-id"
```

#### 4. Verify Setup

```bash
terraform version
az account show
```

## 🔧 Usage & Integration

### Module Integration Methods

#### 1. **Local Path Reference** (Recommended for development)
```hcl
module "my_resource" {
  source = "./modules/Resource-Group"
  # ... configuration
}
```

#### 2. **Git Repository Reference** (Recommended for production)
```hcl
module "my_resource" {
  source = "git::https://github.com/your-org/azurerm-terraform-modules.git//modules/Resource-Group?ref=v1.0.0"
  # ... configuration
}
```

#### 3. **Terraform Registry** (Future enhancement)
```hcl
module "my_resource" {
  source  = "your-org/resource-group/azurerm"
  version = "~> 1.0"
  # ... configuration
}
```

### Environment-Specific Configurations

#### Development Environment
```hcl
locals {
  env_config = {
    environment = "dev"
    sku_size   = "Basic"
    replica_count = 1
  }
}
```

#### Production Environment  
```hcl
locals {
  env_config = {
    environment = "prod"
    sku_size   = "Standard"  
    replica_count = 3
    backup_enabled = true
    monitoring_enabled = true
  }
}
```

### Code Quality & Standards

```bash
# Format code
terraform fmt -recursive

# Validate syntax  
terraform validate

# Security scanning
tfsec .

# Linting
tflint
```

## 📄 License & Support

### License
This project is licensed under the **MIT License** - see the [LICENSE](./LICENSE) file for details.

### Support & Community

- **🐛 Issues**: [GitHub Issues](https://github.com/your-org/azurerm-terraform-modules/issues)


### Versioning Strategy

We use **[Semantic Versioning](https://semver.org/)**:
- **MAJOR**: Breaking changes
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes (backwards compatible)

---

<div align="center">

**Built with ❤️ by Ravindran Dharshan**

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

</div>
