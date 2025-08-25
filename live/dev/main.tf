provider "azuread" {}

module "key_vault" {
  source              = "../../modules/key_vault"
  environment         = var.environment
  location            = var.location
  resource_group_name = "my-resource-group"
  key_vault_name      = "kv-${var.environment}-project"
  tenant_id           = data.azuread_client_config.current.tenant_id
}

module "app_registration" {
  source               = "../../modules/app_registration"
  environment          = var.environment
  location             = var.location
  app_name             = "my-app"
  key_vault_id         = module.key_vault.key_vault_id
  key_vault_secret_name = "app-sp-password-dev"
}

data "azuread_client_config" "current" {}

module "group" {
  source      = "../../modules/group"
  environment = var.environment
  location    = var.location
  group_name  = "my-group"
}

module "user" {
  source      = "../../modules/user"
  environment = var.environment
  location    = var.location
  user_principal_name = "user1@domain.com"
  display_name        = "User One"
}

module "group_membership" {
  source       = "../../modules/group_membership"
  environment  = var.environment
  user_object_id = module.user.user_object_id
  group_object_id = module.group.group_object_id
}

module "role_assignment" {
  source            = "../../modules/role_assignment"
  environment       = var.environment
  principal_id      = module.user.user_object_id
  role_definition_name = "Contributor"
  scope             = "/subscriptions/your-subscription-id"
}

