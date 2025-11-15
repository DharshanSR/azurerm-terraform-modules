# Azure Resource Manager Terraform Modules

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> **Enterprise-grade Terraform modules for Azure Resource Manager (ARM) infrastructure provisioning**

This repository provides a comprehensive collection of production-ready, reusable Terraform modules designed for Azure cloud infrastructure. Each module follows industry best practices, ensuring consistency, security, and maintainability across your Infrastructure as Code (IaC) implementations.

## 📦 Available Modules

### Core Infrastructure

| Module | Version | Azure Resource | Description | Status | Documentation |
|--------|---------|----------------|-------------|--------|---------------|
| **[Resource-Group](./modules/Resource-Group)** | `v1.0` | `azurerm_resource_group` | Foundation resource group with standardized naming | ✅ Stable | [📖 Docs](./docs/Resource-Group.md) |
| **[Virtual-Network](./modules/Virtual-Network)** | `v1.0` | `azurerm_virtual_network` | Enterprise VNet with customizable address spaces | ✅ Stable | [📖 Docs](./docs/Virtual-Network.md) |
| **[Subnet](./modules/Subnet)** | `v1.0` | `azurerm_subnet` | Flexible subnet configuration with delegation support | ✅ Stable | [📖 Docs](./docs/Subnet.md) |

### Security & Access

| Module | Version | Azure Resource | Description | Status | Documentation |
|--------|---------|----------------|-------------|--------|---------------|
| **[Network-Security-Group](./modules/Network-Security-Group)** | `v1.0` | `azurerm_network_security_group` | NSG with standardized security configurations | ✅ Stable | [📖 Docs](./docs/Network-Security-Group.md) |
| **[Network-Security-Rule](./modules/Network-Security-Rule)** | `v1.0` | `azurerm_network_security_rule` | Granular security rule management | ✅ Stable | [📖 Docs](./docs/Network-Security-Rule.md) |
| **[Bastion-Host](./modules/Bastion-Host)** | `v1.0` | `azurerm_bastion_host` | Secure RDP/SSH access with Standard/Basic SKU support | ✅ Stable | [📖 Docs](./docs/Bastion-Host.md) |

### Networking & Connectivity

| Module | Version | Azure Resource | Description | Status | Documentation |
|--------|---------|----------------|-------------|--------|---------------|
| **[Public-IP](./modules/Public-IP)** | `v1.0` | `azurerm_public_ip` | Static/Dynamic public IP with Standard/Basic SKU | ✅ Stable | [📖 Docs](./docs/Public-IP.md) |
| **[Public-IP-Prefix](./modules/Public-IP-Prefix)** | `v1.0` | `azurerm_public_ip_prefix` | Reserved public IP ranges for predictable addressing | ✅ Stable | [📖 Docs](./docs/Public-IP-Prefix.md) |
| **[Network-Interface](./modules/Network-Interface)** | `v1.0` | `azurerm_network_interface` | VM network interface with IP configuration options | ✅ Stable | [📖 Docs](./docs/Network-Interface.md) |
| **[Subnet-NSG-Association](./modules/Subnet-NSG-Association)** | `v1.0` | `azurerm_subnet_network_security_group_association` | Secure subnet-NSG binding | ✅ Stable | [📖 Docs](./docs/Subnet-NSG-Association.md) |

### Compute Resources

| Module | Version | Azure Resource | Description | Status | Documentation |
|--------|---------|----------------|-------------|--------|---------------|
| **[VM-Linux](./modules/VM-Linux)** | `v1.0` | `azurerm_linux_virtual_machine` | Enterprise Linux VMs with customizable configurations | ✅ Stable | [📖 Docs](./docs/VM-Linux.md) |


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
