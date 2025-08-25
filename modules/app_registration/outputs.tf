output "application_id" {
  value = azuread_application.app.client_id  # use client_id instead of application_id
}

output "service_principal_id" {
  value = azuread_service_principal.app_sp.id
}

output "service_principal_secret" {
  value     = azuread_application_password.app_sp_password.value
  sensitive = true
}

output "app_sp_password" {
  value     = azuread_application_password.app_sp_password.value
  sensitive = true
}
