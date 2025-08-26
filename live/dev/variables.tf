variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "user_principal_name" {
  type = string
}

variable "user_password" {
  type      = string
  sensitive = true
}
