output "application_id" {
  value = azuread_application.this.client_id
}

output "service_principal_id" {
  value = azuread_service_principal.this.object_id
}

output "client_secret" {
  value     = azuread_application_password.client_secret.value
  sensitive = true
}
