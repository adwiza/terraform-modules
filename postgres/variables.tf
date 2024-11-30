variable "database_name" {
  description = "The name of the database to create"
  type        = string
}

variable "roles" {
  description = "List of roles with permissions to be created"
  type = list(object({
    name        = string
    password    = string
    superuser   = bool
    login       = bool
    replication = bool
    bypass_rls  = bool
  }))
}

variable "postgresql_host" {
  description = "PostgreSQL host"
  type        = string
}

variable "postgresql_port" {
  description = "PostgreSQL port"
  type        = number
}

variable "postgresql_username" {
  description = "PostgreSQL username"
  type        = string
}

variable "postgresql_password" {
  description = "PostgreSQL password"
  type        = string
}

variable "postgresql_sslmode" {
  description = "SSL mode for PostgreSQL connection"
  type        = string
  default     = "disable"
}
