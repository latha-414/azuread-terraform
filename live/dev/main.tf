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
  source           = "../../modules/role_assignment"
  display_name     = "My-App"
  owner_object_ids = ["<owner-object-id>"]
}


