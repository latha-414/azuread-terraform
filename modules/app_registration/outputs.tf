output "app_id" {
  description = "Azure AD application ID"
  value       = azuread_application.this.application_id
}

output "sp_id" {
  description = "Service principal ID"
  value       = azuread_service_principal.this.id
}

output "client_secret" {
  description = "Client secret value (random or provided)"
  value       = azuread_application_password.client_secret.value
  sensitive   = true
}
