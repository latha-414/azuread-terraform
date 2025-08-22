resource "azuread_application" "this" {
  display_name = var.display_name
  owners       = var.owner_object_ids

  api {
    oauth2_permission_scope {
      admin_consent_description  = "Access API as a user"
      admin_consent_display_name = "User API Access"
      enabled                    = true
      id                         = uuid()
      type                       = "User"
      value                      = "access_as_user"
    }
  }
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}

resource "azuread_application_password" "client_secret" {
  application_id = azuread_application.this.application_id
  display_name   = "client-secret"
  end_date       = timeadd(timestamp(), "8760h")
}
