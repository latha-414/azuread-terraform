resource "azuread_application" "this" {
  display_name = var.display_name
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}

resource "azuread_application_password" "client_secret" {
  application_id = azuread_application.this.id
  display_name   = "client-secret"
  end_date       = timeadd(timestamp(), "8760h") # 1 year
}
