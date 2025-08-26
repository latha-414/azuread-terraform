resource "azuread_application" "app" {
  display_name = "${var.app_name}-${var.environment}"
}

resource "azuread_service_principal" "app_sp" {
  client_id = azuread_application.app.client_id
}

resource "azuread_application_password" "app_sp_password" {
  application_id = azuread_application.app.id
  display_name   = "Secret for ${var.app_name}-${var.environment}"
  end_date      = timeadd(timestamp(), "8760h")  # 1 year from now
}

resource "azurerm_key_vault_secret" "app_sp_password_secret" {
  name         = var.key_vault_secret_name
  value        = azuread_application_password.app_sp_password.value
  key_vault_id = var.key_vault_id
  depends_on   = [azuread_application_password.app_sp_password]
}

data "azurerm_key_vault_secret" "app_sp_password" {
  name         = var.key_vault_secret_name
  key_vault_id = var.key_vault_id
}
