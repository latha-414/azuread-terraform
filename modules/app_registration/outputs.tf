# Outputs
output "service_principal_id" {
  value = azuread_service_principal.this.object_id
}

output "application_id" {
  value = azuread_application.this.id
}

output "admin_app_role_id" {
  value = tolist(azuread_application.this.app_role)[0].id
}
