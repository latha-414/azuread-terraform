output "app_id" {
  description = "Azure AD Application ID"
  value       = azuread_application.this.id
}

output "service_principal_id" {
  description = "Service principal ID for the app"
  value       = azuread_service_principal.this.id
}

output "app_role_ids" {
  description = "Map of app role display names to IDs"
  value = { for r in azuread_application.this.app_role : r.value => r.id }
}
