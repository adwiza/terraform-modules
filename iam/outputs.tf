output "minio_policy" {
  value = minio_iam_policy.iam_policy_name.policy
}