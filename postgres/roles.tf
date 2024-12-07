resource "random_password" "role_passwords" {
  for_each = { for r in var.roles : r.name => r if r.password == null }

  length           = 16
  special          = false # Customize as needed
  override_special = "_%@"

}

resource "postgresql_role" "roles" {
  for_each = { for r in var.roles : r.name => r }

  name                      = each.value.name
  password                  = coalesce(each.value.password, random_password.role_passwords[each.key].result)
  superuser                 = each.value.superuser
  login                     = each.value.login
  replication               = each.value.replication
  bypass_row_level_security = each.value.bypass_rls
}

resource "vault_generic_secret" "postgres_instance" {
  path = var.vault_path

  for_each = { for r in var.roles : r.name => r }

  data_json = jsonencode({
    username      = each.value.name
    database_name = var.database_name
    password      = random_password.role_passwords[each.key].result
    host          = var.postgresql_host
    port          = var.postgresql_port
    DSN           = "${var.dialect}://${each.value.name}:${random_password.role_passwords[each.key].result}@${var.postgresql_host}:${var.postgresql_port}/${var.database_name}"
  })

  lifecycle {
    ignore_changes = [data_json]
  }
}