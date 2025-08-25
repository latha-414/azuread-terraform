resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                   = "standard"

  soft_delete_enabled         = true
  purge_protection_enabled    = false

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_client_config.current.object_id
    key_permissions = [
      "get",
      "list",
    ]
    secret_permissions = [
      "get",
      "list",
      "set",
    ]
  }
}

# Required data source to get current Azure AD user
data "azuread_client_config" "current" {}
