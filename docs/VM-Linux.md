# VM Linux Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white)](https://azure.Microsoft.com/)

## What is an Azure Linux Virtual Machine?

An **Azure Linux Virtual Machine** is a scalable, on-demand computing resource running Linux operating systems in the cloud. VMs provide complete control over the operating system and applications, offering flexibility for custom configurations, software installations, and workload management with various sizes and performance tiers.

Creates an Azure Linux Virtual Machine with SSH key authentication.

## Usage

```hcl
module "linux_vm" {
  source = "./modules/VM-Linux"
  
  virtual_machine_name = "webapp-vm"
  location            = "East US"
  resource_group_name = module.resource_group.name
  network_interface_ids = [module.vm_nic.network_interface_id]
  vm_size            = "Standard_B2s"
  project           = "webapp"
  
  # OS Configuration
  admin_username = "azureuser"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
  
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
  source = "./modules/VM-Linux"
  
  virtual_machine_name = "web-server-01"
  location            = "East US"
  resource_group_name = module.resource_group.name
  network_interface_ids = [module.web_nic.network_interface_id]
  vm_size            = "Standard_B2s"
  project           = "webapp"
  
  admin_username = "webadmin"
  ssh_public_key = file("~/.ssh/web_rsa.pub")
}

# Application Server
module "app_server" {
  source = "./modules/VM-Linux"
  
  virtual_machine_name = "app-server-01"
  location            = "East US"
  resource_group_name = module.resource_group.name
  network_interface_ids = [module.app_nic.network_interface_id]
  vm_size            = "Standard_D2s_v3"
  project           = "webapp"
  
  admin_username = "appadmin"
  ssh_public_key = file("~/.ssh/app_rsa.pub")
}

# Database Server
module "db_server" {
  source = "./modules/VM-Linux"
  
  virtual_machine_name = "db-server-01"
  location            = "East US"
  resource_group_name = module.resource_group.name
  network_interface_ids = [module.db_nic.network_interface_id]
  vm_size            = "Standard_D4s_v3"
  project           = "webapp"
  
  admin_username = "dbadmin"
  ssh_public_key = file("~/.ssh/db_rsa.pub")
}
```

## Custom OS Image Example

```hcl
module "custom_linux_vm" {
  source = "./modules/VM-Linux"
  
  virtual_machine_name = "custom-vm"
  location            = "East US"
  resource_group_name = module.resource_group.name
  network_interface_ids = [module.vm_nic.network_interface_id]
  vm_size            = "Standard_D2s_v3"
  project           = "webapp"
  
  # Custom OS configuration
  os_disk_size_gb = 128
  admin_username = "customadmin"
  ssh_public_key = file("~/.ssh/custom_rsa.pub")
  
  # Custom image (if using marketplace image)
  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}
```