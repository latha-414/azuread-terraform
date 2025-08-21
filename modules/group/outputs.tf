output "group_object_ids" {
  value = { for k, v in azuread_group.this : k => v.object_id }
}
