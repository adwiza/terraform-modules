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

variable "iam_policies" {
  description = "List of IAM policies to be created"
  type = list(object({
    iam_policy_name = string
    iam_policy_json = string
  }))
}

variable "ldap_groups_policy_attachments" {
  description = "List of group-policy attachments"
  type = list(object({
    group_dn = string
    policies = list(string)
  }))
}