resource "azurerm_resource_group" "resource_group" {
    name     = join("-", [var.resource_group_name])
    location = var.location
    tags     = var.tags
}