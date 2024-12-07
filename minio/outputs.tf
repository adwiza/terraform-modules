output "minio_id" {
  value = "${minio_s3_bucket.bucket.id}"
}

output "minio_url" {
  value = "${minio_s3_bucket.bucket.bucket_domain_name}"
}

output "policies" {
  value = "${minio_s3_bucket_policy.airflow_dev_policy.id}"
}