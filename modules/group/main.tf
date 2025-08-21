resource "azuread_group" "this" {
  for_each = { for g in var.groups : g.display_name => g }

  display_name    = each.value.display_name
  mail_nickname   = each.value.mail_nickname
  security_enabled = true
}

resource "azuread_group_member" "membership" {
  for_each = { for m in var.memberships : "${m.user_upn}-${m.group_name}" => m }

  group_object_id  = azuread_group.this[each.value.group_name].object_id
  member_object_id = var.user_object_ids[each.value.user_upn]
}
