resource "azuread_app_role_assignment" "this" {
  for_each = { for a in var.assignments : "${a.principal_object_id}-${a.resource_object_id}" => a }

  app_role_id         = each.value.app_role_id
  principal_object_id = each.value.principal_object_id
  resource_object_id  = each.value.resource_object_id
}
