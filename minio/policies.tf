resource "minio_s3_bucket_policy" "airflow_dev_policy" {
#   depends_on = [minio_s3_bucket.bucket]
  bucket     = minio_s3_bucket.bucket.bucket
  policy     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {"AWS": ["adwiz"]},
      "Resource": [
        "arn:aws:s3:::${minio_s3_bucket.bucket.bucket}",
        "arn:aws:s3:::${minio_s3_bucket.bucket.bucket}/*"
      ],
      "Action": [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject"
      ]
    }
  ]
}
EOF
}
