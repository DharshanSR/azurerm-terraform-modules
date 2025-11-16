resource "azurerm_storage_account_local_user" "storage_account_local_user" {
  name               = var.name
  storage_account_id = var.storage_account_id
  home_directory     = var.home_directory

  dynamic "permission_scope" {
    for_each = var.permission_scopes != null ? var.permission_scopes : []
    content {
      resource_name = permission_scope.value.resource_name
      service       = permission_scope.value.service
      
      dynamic "permissions" {
        for_each = permission_scope.value.permissions != null ? [permission_scope.value.permissions] : []
        content {
          create = permissions.value.create
          delete = permissions.value.delete
          list   = permissions.value.list
          read   = permissions.value.read
          write  = permissions.value.write
        }
      }
    }
  }

  dynamic "ssh_authorized_key" {
    for_each = var.ssh_authorized_keys != null ? var.ssh_authorized_keys : []
    content {
      description = ssh_authorized_key.value.description
      key         = ssh_authorized_key.value.key
    }
  }
}