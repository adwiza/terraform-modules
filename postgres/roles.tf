resource "random_password" "role_passwords" {
  for_each = { for r in var.roles : r.name => r if r.password == null }

  length           = 16
  special          = false  # Customize as needed
  override_special = "_%@"
}

resource "postgresql_role" "roles" {
  for_each = { for r in var.roles : r.name => r }

  name       = each.value.name
  password   = coalesce(each.value.password, random_password.role_passwords[each.key].result)
  superuser  = each.value.superuser
  login      = each.value.login
  replication = each.value.replication
  bypass_row_level_security = each.value.bypass_rls

  lifecycle {
    prevent_destroy = false
  }
}