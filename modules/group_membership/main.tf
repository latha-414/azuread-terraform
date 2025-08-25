resource "azuread_group_member" "group_member" {
  group_object_id  = var.group_object_id
  member_object_id = var.user_object_id
}
