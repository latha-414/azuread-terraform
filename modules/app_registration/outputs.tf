output "app_id" {
  value = azuread_application.this.application_id
}

output "service_principal_id" {
  value = azuread_service_principal.this.id
}

output "app_role_ids" {
  description = "Map of app role values to IDs"
  value = {
    for r in azuread_application.this.oauth2_permission_scope : r.value => r.id
  }
}
