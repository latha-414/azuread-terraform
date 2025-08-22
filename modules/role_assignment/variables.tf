variable "assignments" {
  description = "List of role assignments to create"
  type = list(object({
    app_role_id          = string
    principal_object_id  = string
    resource_object_id   = string
  }))
}
