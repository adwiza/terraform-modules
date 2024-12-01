resource "postgresql_database" "database" {
  name = var.database_name

  lifecycle {
    prevent_destroy = false
  }
}
