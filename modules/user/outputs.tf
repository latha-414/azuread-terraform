output "user_object_ids" {
  value = { for k, v in azuread_user.this : k => v.object_id }
}
