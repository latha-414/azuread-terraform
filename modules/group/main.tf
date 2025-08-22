resource "azuread_group" "this" {
  display_name     = var.display_name
  mail_enabled     = false
  security_enabled = true
}
