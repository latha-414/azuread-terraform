resource "azuread_application" "this" {
  display_name = var.display_name
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_application_password" "client_secret" {
  application_id = azuread_application.this.id
  display_name   = "client-secret"
  end_date       = timeadd(timestamp(), "8760h")
}
