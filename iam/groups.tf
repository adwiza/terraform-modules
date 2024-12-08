resource "minio_iam_group" "developers" {
  name = "developers"
}

resource "minio_iam_group" "admins" {
  name = "admins"
}