output "user_id" {
  description = "The object ID of the created Azure AD user."
  value       = azuread_user.user.object_id
}

output "user_principal_name" {
  description = "The user principal name (email) of the Azure AD user."
  value       = azuread_user.user.user_principal_name
}
