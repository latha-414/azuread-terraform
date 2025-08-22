output "application_id" {
  value = azuread_application.this.application_id
}

output "client_id" {
  value = azuread_service_principal.this.id
}

output "client_secret" {
  value     = azuread_application_password.client_secret.value
  sensitive = true
}
