variable "display_name" {
  type        = string
  description = "Azure AD Application display name"
}

variable "owner_object_ids" {
  type        = list(string)
  description = "List of owners for the app"
}
