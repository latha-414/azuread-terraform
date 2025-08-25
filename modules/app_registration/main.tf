resource "azuread_application" "app" {
  display_name = "${var.app_name}-${var.environment}"
}

resource "azuread_service_principal" "app_sp" {
  client_id = azuread_application.app.client_id
}

data "azurerm_key_vault_secret" "app_sp_password" {
  name         = var.key_vault_secret_name
  key_vault_id = var.key_vault_id
}

resource "azuread_application_password" "app_sp_password" {
  application_id    = azuread_application.app.id
  display_name      = "Secret for ${var.app_name}-${var.environment}"
  end_date_relative = "8760h"  # 1 year from creation
}
