resource "azuread_application" "this" {
  display_name = var.display_name
  owners       = var.owner_object_ids
}

resource "azuread_service_principal" "this" {
  # v2+ uses `application_id` as client reference
  application_id = azuread_application.this.id
}

resource "azuread_application_password" "client_secret" {
  application_id = azuread_application.this.id
  display_name   = "client-secret"
  end_date       = timeadd(timestamp(), "8760h")
}

# Optional: app roles
resource "azuread_app_role" "access_as_user" {
  application_object_id = azuread_application.this.id
  display_name          = "access_as_user"
  allowed_member_types  = ["User", "Application"]
  description           = "Access API as a user"
  value                 = "access_as_user"
}
