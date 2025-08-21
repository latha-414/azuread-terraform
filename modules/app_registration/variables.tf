variable "display_name" {
  description = "Application display name"
  type        = string
}

variable "owner_object_ids" {
  description = "List of Azure AD user object IDs who will be owners"
  type        = list(string)
  default     = []
}

variable "client_secret_value" {
  description = "Optional static client secret (use vault recommended)"
  type        = string
  default     = ""
}
