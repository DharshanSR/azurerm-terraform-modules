# VM Windows Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

## What is an Azure Windows Virtual Machine?

An **Azure Windows Virtual Machine** is a scalable, on-demand computing resource running Windows Server operating systems in the cloud. VMs provide complete control over the operating system and applications, ideal for running .NET applications, Active Directory, SQL Server, and other Windows-based workloads with various sizes and performance tiers.

Creates an Azure Windows Virtual Machine with password authentication and automatic update capabilities.

## Usage

```hcl
module "windows_vm" {
  source = "./modules/VM-Windows"
  
  windows_virtual_machine_name = "webapp-vm"
  location                     = "East US"
  resource_group_name          = module.resource_group.name
  network_interface_ids        = [module.vm_nic.network_interface_id]
  size                         = "Standard_B2s"
  
  # Authentication
  admin_username = "winadmin"
  admin_password = var.admin_password  # Use secure variable
  
  # OS Configuration
  source_image_sku = "2022-datacenter-azure-edition"
  
  tags = {
    Environment = "Production"
    Tier        = "Web"
  }
}
```

## Naming Convention

**Format**: `{prefix}-{name}-{location}`

**Example**: `vm-webapp-vm-eastus`

## Multiple VMs Example

```hcl
# Web Server
module "web_server" {
  source = "./modules/VM-Windows"
  
  windows_virtual_machine_name = "web-server-01"
  location                     = "East US"
  resource_group_name          = module.resource_group.name
  network_interface_ids        = [module.web_nic.network_interface_id]
  size                         = "Standard_B2ms"
  
  admin_username       = "webadmin"
  admin_password       = var.web_admin_password
  source_image_sku     = "2022-datacenter-azure-edition"
}

# Application Server
module "app_server" {
  source = "./modules/VM-Windows"
  
  windows_virtual_machine_name = "app-server-01"
  location                     = "East US"
  resource_group_name          = module.resource_group.name
  network_interface_ids        = [module.app_nic.network_interface_id]
  size                         = "Standard_D2s_v3"
  
  admin_username       = "appadmin"
  admin_password       = var.app_admin_password
  source_image_sku     = "2022-datacenter-azure-edition"
}

# Database Server
module "db_server" {
  source = "./modules/VM-Windows"
  
  windows_virtual_machine_name = "db-server-01"
  location                     = "East US"
  resource_group_name          = module.resource_group.name
  network_interface_ids        = [module.db_nic.network_interface_id]
  size                         = "Standard_D4s_v3"
  
  admin_username           = "dbadmin"
  admin_password           = var.db_admin_password
  source_image_sku         = "2022-datacenter-azure-edition"
  os_disk_storage_type     = "Premium_LRS"
}
```

## Custom Configuration Example

```hcl
module "custom_windows_vm" {
  source = "./modules/VM-Windows"
  
  windows_virtual_machine_name = "custom-vm"
  location                     = "West US 2"
  resource_group_name          = module.resource_group.name
  network_interface_ids        = [module.vm_nic.network_interface_id]
  size                         = "Standard_D2s_v3"
  
  # Authentication
  admin_username = "customadmin"
  admin_password = var.custom_admin_password
  
  # Custom OS configuration
  source_image_publisher = "MicrosoftWindowsServer"
  source_image_offer     = "WindowsServer"
  source_image_sku       = "2022-datacenter-core-g2"
  source_image_version   = "latest"
  
  # Storage configuration
  os_disk_caching      = "ReadWrite"
  os_disk_storage_type = "Premium_LRS"
  
  tags = {
    Environment = "Production"
    Application = "CustomApp"
    ManagedBy   = "Terraform"
  }
}
```

## Windows Server SKU Options

Common SKU values for Windows Server:
- `2022-datacenter-azure-edition` - Windows Server 2022 Datacenter: Azure Edition
- `2022-datacenter` - Windows Server 2022 Datacenter
- `2022-datacenter-core` - Windows Server 2022 Datacenter Core
- `2019-datacenter` - Windows Server 2019 Datacenter
- `2016-datacenter` - Windows Server 2016 Datacenter

## Security Best Practices

1. **Password Complexity**: Ensure admin passwords meet Azure's complexity requirements (12-123 characters, with uppercase, lowercase, numbers, and special characters)
2. **Network Security**: Always associate VMs with NSGs for traffic control
3. **Managed Identity**: Consider using managed identities for application authentication

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `windows_virtual_machine_name` | The main name for the Windows Virtual Machine | `string` | n/a | yes |
| `resource_group_name` | The name of the Resource Group in which the VM should exist | `string` | n/a | yes |
| `location` | The Azure location where the Windows Virtual Machine should exist | `string` | n/a | yes |
| `network_interface_ids` | A list of Network Interface IDs to attach to this VM | `list(string)` | n/a | yes |
| `admin_username` | The username of the local administrator | `string` | n/a | yes |
| `admin_password` | The password for the local administrator account | `string` | n/a | yes |
| `windows_virtual_machine_prefix` | A prefix to add to the VM name | `string` | `"vm"` | no |
| `size` | The SKU (size) of the Virtual Machine | `string` | `"Standard_F2"` | no |
| `os_disk_caching` | The Type of Caching for the OS Disk | `string` | `"ReadWrite"` | no |
| `os_disk_storage_type` | The Type of Storage Account for the OS Disk | `string` | `"Standard_LRS"` | no |
| `source_image_publisher` | Publisher of the image used to create the VM | `string` | `"MicrosoftWindowsServer"` | no |
| `source_image_offer` | Offer of the image used to create the VM | `string` | `"WindowsServer"` | no |
| `source_image_sku` | SKU of the image used to create the VM | `string` | n/a | yes |
| `source_image_version` | Version of the image used to create the VM | `string` | `"latest"` | no |
| `tags` | A map of tags to assign to the Virtual Machine | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `id` | The ID of the Windows Virtual Machine |
| `virtual_machine_id` | A 128-bit identifier which uniquely identifies this Virtual Machine |
| `name` | The name of the Virtual Machine |
| `private_ip_address` | The Primary Private IP Address assigned to this Virtual Machine |
| `public_ip_address` | The Primary Public IP Address assigned to this Virtual Machine (if associated) |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | >= 3.0 |

## Resources

- [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)
