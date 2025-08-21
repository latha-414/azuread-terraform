output "application_id" {
  description = "The unique client ID (applicationId) of the app registration"
  value       = azuread_application.this.client_id
}

output "application_object_id" {
  description = "The object ID of the application"
  value       = azuread_application.this.object_id
}

output "service_principal_id" {
  description = "The object ID of the service principal"
  value       = azuread_service_principal.this.object_id
}

output "client_secret_value" {
  description = "The client secret value (only available after apply)"
  sensitive   = true
  value       = azuread_application_password.client_secret.value
}

output "client_secret_id" {
  description = "The ID of the application password (not the secret itself)"
  value       = azuread_application_password.client_secret.id
}
