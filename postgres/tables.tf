data "postgresql_tables" "my_tables" {
  database = var.database_name
}