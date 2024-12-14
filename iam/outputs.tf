output "iam_policy_ids" {
  description = "List of IAM policy IDs"
  value       = [for policy in minio_iam_policy.iam_policy_name : policy.id]
}

output "group_policy_attachments" {
  value = {
    for group_attachment in var.ldap_groups_policy_attachments :
    group_attachment.group_dn => {
      policies = [for policy_name in group_attachment.policies :
      minio_iam_policy.iam_policy[policy_name].name]
    }
  }
  description = "A map of group names and their attached policies"
}
