variable "display_name" {
  type        = string
  description = "Display name for the Azure AD Application"
}

variable "owner_object_ids" {
  type        = list(string)
  description = "List of object IDs for application owners"
  default     = []
}

variable "client_secret_value" {
  type        = string
  description = "Optional pre-defined client secret value (use external secret management). Leave empty to auto-generate."
  default     = ""
}
