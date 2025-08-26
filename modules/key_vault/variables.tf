variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "key_vault_base_name" {
  type        = string
  description = "Base name of the Key Vault"
}
