resource "random_id" "unique_hex" {
  byte_length = 4
}

locals {
  key_vault_name = "${var.key_vault_base_name}-${var.environment}-${substr(random_id.unique_hex.hex, 0, 6)}"
}

resource "azurerm_key_vault" "this" {
  name                = local.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]
  }
}
