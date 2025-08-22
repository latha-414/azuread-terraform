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

module "role_assignment" {
  source = "../../modules/role_assignment"

  assignments = [
    {
      app_role_id         = module.app.app_role_ids["Reader"]
      principal_object_id = module.groups.group_object_ids["app-owners"]
      resource_object_id  = module.app.service_principal_id
    }
  ]
}




