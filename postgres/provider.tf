terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.24.0"
    }
  }
}

provider "postgresql" {
  host            = var.postgresql_host
  port            = var.postgresql_port
  username        = var.postgresql_username
  password        = var.postgresql_password
  sslmode         = var.postgresql_sslmode
}
