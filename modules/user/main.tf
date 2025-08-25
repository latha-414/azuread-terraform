resource "azuread_user" "user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.display_name
  mail_nickname         = var.mail_nickname
  password              = var.user_password
  force_password_change = var.force_password_change
  account_enabled       = var.account_enabled
}
