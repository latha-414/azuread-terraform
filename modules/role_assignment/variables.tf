variable "assignments" {
  description = "List of role assignments"
  type = list(object({
    principal_id = string
    app_id       = string
    app_role_id  = string
  }))
}
