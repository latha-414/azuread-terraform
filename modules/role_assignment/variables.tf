variable "assignments" {
  description = "List of role assignments"
  type = list(object({
    app_role_id  = string
    principal_id = string
    resource_id  = string
  }))
}
