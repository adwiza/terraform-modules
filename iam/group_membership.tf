resource "minio_iam_user" "adwiz" {
  name = "adwiz"
}

resource "minio_iam_user" "user_two" {
  name = "test-user-two"
}

resource "minio_iam_group_membership" "admins" {
  name = "admins-group-membership"

  users = [
    "${minio_iam_user.adwiz.name}",
  ]

  group = minio_iam_group.admins.name
}

resource "minio_iam_group_membership" "developers" {
  name = "developers-group-membership"

  users = [
    "${minio_iam_user.user_two.name}",
  ]

  group = minio_iam_group.developers.name
}

output "minio_name" {
  value = minio_iam_group_membership.developers.id
}

output "minio_users" {
  value = minio_iam_group_membership.developers.users
}

output "minio_group" {
  value = minio_iam_group_membership.developers.group
}