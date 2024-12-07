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

variable "iam_policy_name" {
  type        = string
  description = "The JSON policy for the IAM policy"
}

variable "iam_policy_json" {
  type        = string
  description = "The JSON policy for the IAM policy"
}