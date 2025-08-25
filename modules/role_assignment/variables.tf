variable "principal_object_id" {
  type = string
  description = "Object ID of the Azure AD Service Principal"
}

variable "resource_object_id" {
  type = string
  description = "Object ID of the target resource"
}

variable "app_role_id" {
  type = string
  description = "App role ID to assign"
}
