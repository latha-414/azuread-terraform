resource "azuread_app_role_assignment" "this" {
  principal_object_id = var.principal_object_id
  resource_object_id  = var.resource_object_id
  app_role_id         = var.app_role_id
}
