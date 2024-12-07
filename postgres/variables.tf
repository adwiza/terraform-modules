variable "database_name" {
  description = "The name of the database to create"
  type        = string
}

variable "roles" {
  description = "List of roles with their configurations"
  type = list(object({
    name        = string
    password    = string
    superuser   = bool
    login       = bool
    replication = bool
    bypass_rls  = bool
  }))
  default = []
}

variable "postgresql_host" {
  description = "PostgreSQL host"
  type        = string
}

variable "postgresql_port" {
  description = "PostgreSQL port"
  type        = number
}

variable "postgresql_root_username" {
  description = "PostgreSQL username"
  type        = string
}

variable "postgresql_root_password" {
  description = "PostgreSQL password"
  type        = string
}

variable "postgresql_sslmode" {
  description = "SSL mode for PostgreSQL connection"
  type        = string
  default     = "disable"
}

variable "password_length" {
  description = "Length of dynamically generated passwords"
  type        = number
  default     = 16
}

variable "vault_path" {
  description = "Vault path"
  type        = string
}

variable "dialect" {
  description = "SQL dialect"
  type        = string
  default     = "postgres"
}