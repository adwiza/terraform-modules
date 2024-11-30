resource "postgresql_role" "roles" {
  for_each = { for r in var.roles : r.name => r }

  name       = each.value.name
  password   = each.value.password
  superuser  = each.value.superuser
  login      = each.value.login
  replication = each.value.replication
  bypass_row_level_security = each.value.bypass_rls
}