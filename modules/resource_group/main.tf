resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = var.location
}
