resource "azuread_application" "this" {
  display_name = var.display_name

  app_roles = [
    {
      allowed_member_types = ["User"]
      description          = "Admin role for the app"
      display_name         = "Admin"
      is_enabled           = true
      value                = "Admin"
    }
  ]
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}
