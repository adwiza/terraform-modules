resource "postgresql_grant" "schema_permissions" {
  for_each = { for r in var.roles : r.name => r }

  database = var.database_name
  role     = each.value.name
  schema   = "public"

  object_type = "schema"
  privileges  = ["USAGE", "CREATE"]

  depends_on = [postgresql_database.database, postgresql_role.roles]
}

# resource "postgresql_grant" "table_permissions" {
#   for_each = { for r in var.roles : r.name => r }

#   database    = var.database_name
#   role        = each.value.name
#   schema      = "public"
#   object_type = "table"

#   privileges = ["SELECT", "INSERT", "UPDATE", "DELETE"]

#   depends_on = [postgresql_database.database, postgresql_role.roles]
# }

resource "postgresql_grant" "sequence_permissions" {
  for_each = { for r in var.roles : r.name => r }

  database    = var.database_name
  role        = each.value.name
  schema      = "public"
  object_type = "sequence"

  privileges = ["USAGE", "SELECT"]

  depends_on = [postgresql_database.database, postgresql_role.roles]
}
