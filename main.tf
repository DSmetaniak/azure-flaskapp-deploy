resource "azurerm_resource_group" "webapp_rg" {
  name     = var.resource_group_name
  location = var.location
}
