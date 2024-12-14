resource "minio_iam_policy" "iam_policy_name" {
  for_each = { for policy in var.iam_policies : policy.iam_policy_name => policy }

  name   = each.key
  policy = each.value.iam_policy_json
}
