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

# Service Principal must reference the application's "client_id"
resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

# App password (client secret)
resource "azuread_application_password" "client_secret" {
  application_id   = azuread_application.this.id # <-- fixed, use "id" not object_id
  display_name     = "client-secret"
  value            = var.client_secret_value != "" ? var.client_secret_value : random_password.secret.result
  end_date_relative = "8760h" # 1 year
}

resource "random_password" "secret" {
  length           = 32
  special          = true
  override_special = "!@#"
  keepers = {
    always_generate = var.client_secret_value == ""
  }
}
