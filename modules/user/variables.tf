variable "users" {
  description = "List of users to create"
  type = list(object({
    display_name       = string
    user_principal_name = string
    mail_nickname      = string
    password           = string
  }))
}
