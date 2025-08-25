resource "azuread_group" "group" {
  display_name = "${var.group_name}-${var.environment}"
  security_enabled = true
}
