output "application_id" {
  value = azuread_application.this.id
}

output "app_role_ids" {
  value = azuread_application.this.api[0].oauth2_permission_scope[*].id
}

output "service_principal_id" {
  value = azuread_service_principal.this.id
}
