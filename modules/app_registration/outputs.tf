output "app_id" {
  value = azuread_application.this.id
}

output "service_principal_id" {
  value = azuread_service_principal.this.id
}

output "app_role_ids" {
  value = {
    access_as_user = azuread_app_role.access_as_user.id
  }
}
