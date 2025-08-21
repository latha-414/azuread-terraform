variable "groups" {
  description = "List of groups to create"
  type = list(object({
    display_name  = string
    mail_nickname = string
  }))
}

variable "memberships" {
  description = "List of users to assign to groups"
  type = list(object({
    user_upn   = string
    group_name = string
  }))
  default = []
}

variable "user_object_ids" {
  description = "Map of user UPN to object IDs"
  type        = map(string)
  default     = {}
}
