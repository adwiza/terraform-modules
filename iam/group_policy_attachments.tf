resource "minio_iam_policy" "iam_policy" {
  for_each = { for policy in var.iam_policies : policy.iam_policy_name => policy }

  name   = each.value.iam_policy_name
  policy = each.value.iam_policy_json
}

resource "minio_iam_group_policy_attachment" "non_ldap_group_policy_attachments" {
  for_each = {
    for pair in flatten([
      for group_attachment in var.non_ldap_group_policy_attachments : [
        for policy in group_attachment.policies :
        {
          group_name  = group_attachment.group_name
          policy_name = policy
        }
      ]
    ]) :
    "${pair.group_name}-${pair.policy_name}" => pair
  }

  group_name  = each.value.group_name
  policy_name = minio_iam_policy.iam_policy[each.value.policy_name].id
}

# resource "minio_iam_ldap_group_policy_attachment" "ldap_groups_policy_attachments" {
#   for_each = {
#     for group_attachment in var.ldap_groups_policy_attachments :
#     group_attachment.group_dn => group_attachment
#   }

#   group_dn = each.value.group_dn

#   policy_name = minio_iam_policy.iam_policy[each.value.policies[0]].id
# }

