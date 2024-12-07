terraform {
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "3.2.1"
    }
  }
}

provider "minio" {
  // required
  minio_server   = var.minio_server
  minio_user     = var.minio_user
  minio_password = var.minio_password

  minio_region      = "us-east-1"
  minio_api_version = "v4"
  minio_ssl         = "false"

}