variable "user_principal_name" {
  type        = string
  description = "The UPN (email) of the Azure AD user."
}

variable "display_name" {
  type        = string
  description = "The display name of the Azure AD user."
}

variable "mail_nickname" {
  type        = string
  description = "The mail nickname (alias) for the Azure AD user."
}

variable "user_password" {
  type        = string
  sensitive   = true
  description = "The password for the Azure AD user."
}

variable "force_password_change" {
  type        = bool
  default     = true
  description = "Whether to force the user to change password on first login."
}

variable "account_enabled" {
  type        = bool
  default     = true
  description = "Whether the user account is enabled."
}
