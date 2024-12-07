output "database_name" {
  description = "The name of the created database"
  value       = var.database_name
}

output "role_names" {
  description = "List of created PostgreSQL roles"
  value       = [for r in var.roles : r.name]
}

output "role_passwords" {
  description = "The passwords for the PostgreSQL roles"
  value = {
    for r in var.roles : r.name => coalesce(
      r.password,
      random_password.role_passwords[r.name].result
    )
  }
  sensitive = true
}
