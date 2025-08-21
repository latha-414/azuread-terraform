provider "azuread" {}

module "users" {
  source = "../../modules/user"
  users  = var.users
}

module "app" {
  source           = "../../modules/app_registration"
  display_name     = var.app_name
  owner_object_ids = values(module.users.user_object_ids)
}

module "groups" {
  source          = "../../modules/group"
  groups          = var.groups
  user_object_ids  = module.users.user_object_ids
  memberships      = var.group_memberships
}

resource "azuread_app_role_assignment" "this" {
  for_each = { for a in var.assignments : "${a.principal_id}-${a.resource_id}" => a }

  app_role_id  = each.value.app_role_id
  principal_id = each.value.principal_id
  resource_id  = each.value.resource_id
}



