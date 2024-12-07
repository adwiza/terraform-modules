resource "minio_iam_policy" "iam_policy_name" {
  name   = var.iam_policy_name
  policy = var.iam_policy_json
}