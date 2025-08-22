resource "azuread_application" "this" {
  display_name = var.display_name
  owners       = var.owner_object_ids

  app_role {
    allowed_member_types = ["User", "Application"]
    description          = "Access API as a user"
    display_name         = "access_as_user"
    value                = "access_as_user"
    id                   = uuid()
    enabled              = true
  }
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_application_password" "client_secret" {
  application_object_id = azuread_application.this.id
  display_name          = "client-secret"
  end_date              = timeadd(timestamp(), "8760h") # 1 year
}
