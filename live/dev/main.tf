provider "azuread" {}

module "app_registration" {
  source       = "../../modules/app_registration"
  display_name = var.app_display_name
}

module "user" {
  source              = "../../modules/user"
  user_principal_name = var.user_principal_name
  display_name        = "Dev User"
  mail_nickname       = "devuser"
  password            = var.user_password
}

module "group" {
  source       = "../../modules/group"
  display_name = var.group_name
}

module "group_membership" {
  source           = "../../modules/group_membership"
  group_object_id  = module.group.group_id
  member_object_id = module.user.user_id
}

module "role_assignment" {
  source              = "../../modules/role_assignment"
  principal_object_id = module.user.user_id
  resource_object_id  = module.app_registration.service_principal_id
  app_role_id         = module.app_registration.admin_app_role_id  # automatic
}


