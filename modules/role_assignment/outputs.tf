# empty or can output assigned IDs
output "assigned_ids" {
  value = [for r in azuread_app_role_assignment.this : r.id]
}
