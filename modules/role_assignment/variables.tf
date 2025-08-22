variable "assignments" {
  description = "List of app role assignments"
  type = list(object({
    app_role_id         = string
    principal_object_id = string
    resource_object_id  = string
  }))
}
