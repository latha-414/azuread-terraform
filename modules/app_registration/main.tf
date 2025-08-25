# Create Azure AD Application
resource "azuread_application" "this" {
  display_name = var.display_name

  api {
    requested_access_token_version = 2
  }
}

# Create Service Principal for the Application
resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.application_id
}
