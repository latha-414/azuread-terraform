variable "app_name" {
  type = string
  default = "demo-app"
}

variable "users" {
  type = list(object({
    display_name       = string
    user_principal_name = string
    mail_nickname      = string
    password           = string
  }))
  default = [
    {
      display_name = "Alice Johnson"
      user_principal_name = "alice.johnson@contoso.com"
      mail_nickname = "alice"
      password      = "SecurePass123!"
    },
    {
      display_name = "Bob Smith"
      user_principal_name = "bob.smith@contoso.com"
      mail_nickname = "bob"
      password      = "SecurePass123!"
    }
  ]
}

variable "groups" {
  type = list(object({
    display_name  = string
    mail_nickname = string
  }))
  default = [
    {
      display_name = "app-owners"
      mail_nickname = "appowners"
    }
  ]
}

variable "group_memberships" {
  type = list(object({
    user_upn   = string
    group_name = string
  }))
  default = [
    { user_upn = "alice.johnson@contoso.com", group_name = "app-owners" },
    { user_upn = "bob.smith@contoso.com", group_name = "app-owners" }
  ]
}
