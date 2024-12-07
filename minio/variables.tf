variable "bucket_name" {
  description = "Bucket name"
  type        = string
  default = "airflow-dev"
}
variable "acl" {
  description = "ACL type"
  type        = string
  default = "private"
}

variable "minio_server" {
  description = "The MinIO server URL"
  type        = string
}

variable "minio_user" {
  description = "The MinIO username"
  type        = string
}

variable "minio_password" {
  description = "The MinIO password"
  type        = string
}
