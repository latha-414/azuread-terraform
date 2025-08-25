resource "azuread_user" "user" {
  user_principal_name = var.user_principal_name
  display_name        = var.display_name
  mail_nickname       = replace(var.user_principal_name, "@.*", "")
  password            = "TempP@ssword123" # Ideally generate or pass securely
  force_password_change = false
  account_enabled      = true
}
