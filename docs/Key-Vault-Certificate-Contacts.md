# Key Vault Certificate Contacts Module

This module creates and manages certificate contacts for an Azure Key Vault. Certificate contacts are used to receive notifications about certificate lifecycle events.

## Features

- Manages certificate contacts for Key Vault
- Supports multiple contacts with different roles
- Configurable email and phone contact information
- Automatic lifecycle management

## Usage

### Basic Usage

```hcl
module "key_vault_certificate_contacts" {
  source = "./modules/Key-Vault-Certificate-Contacts"

  key_vault_id = module.key_vault.key_vault_id
  contacts = [
    {
      email = "admin@example.com"
      name  = "Certificate Administrator"
      phone = "+1-555-0123"
    }
  ]
}
```

### Advanced Usage with Multiple Contacts

```hcl
module "key_vault_certificate_contacts" {
  source = "./modules/Key-Vault-Certificate-Contacts"

  key_vault_id = module.key_vault.key_vault_id
  contacts = [
    {
      email = "security@company.com"
      name  = "Security Team"
      phone = "+1-555-0100"
    },
    {
      email = "ops@company.com"
      name  = "Operations Team"
      phone = "+1-555-0200"
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_certificate_contacts.key_vault_certificate_contacts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate_contacts) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| key_vault_id | The ID of the Key Vault | `string` | n/a | yes |
| contacts | List of certificate contacts | `list(object({`<br>`email = string`<br>`name = optional(string)`<br>`phone = optional(string)`<br>`}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Key Vault Certificate Contacts |

## Example

```hcl
# Resource Group
module "resource_group" {
  source = "./modules/Resource-Group"

  resource_group_prefix   = "rg"
  resource_group_name     = "example"
  location               = "East US"
  resource_group_tags    = {
    Environment = "Development"
    Project     = "Certificate Management"
  }
}

# Key Vault
module "key_vault" {
  source = "./modules/Key-Vault"

  key_vault_prefix    = "kv"
  key_vault_name      = "certificates"
  location           = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku_name           = "standard"

  key_vault_tags = {
    Environment = "Development"
    Purpose     = "Certificate Storage"
  }
}

# Certificate Contacts
module "certificate_contacts" {
  source = "./modules/Key-Vault-Certificate-Contacts"

  key_vault_id = module.key_vault.key_vault_id
  contacts = [
    {
      email = "security@company.com"
      name  = "Security Team"
      phone = "+1-555-0100"
    },
    {
      email = "devops@company.com"
      name  = "DevOps Team"
      phone = "+1-555-0200"
    }
  ]
}
```

This module enables proper certificate lifecycle management by ensuring the right people are notified about certificate events such as upcoming expirations or renewal failures.