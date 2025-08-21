resource "azuread_user" "this" {
  for_each = { for u in var.users : u.user_principal_name => u }

  display_name       = each.value.display_name
  user_principal_name = each.value.user_principal_name
  mail_nickname      = each.value.mail_nickname
  password           = each.value.password
  force_password_change = false
}
