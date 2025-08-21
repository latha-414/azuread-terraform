resource "azuread_app_role_assignment" "this" {
  for_each = { for a in var.assignments : "${a.principal_id}-${a.app_id}" => a }

  app_role_id   = each.value.app_role_id
  principal_id  = each.value.principal_id
  resource_id   = each.value.app_id
}
