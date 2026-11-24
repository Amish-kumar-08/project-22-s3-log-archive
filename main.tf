
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# 1. Create S3 Bucket
resource "aws_s3_bucket" "log_archive" {
  bucket = "project-22-s3-log-archive-590507089733"

  tags = {
    Name        = "Project-22-Log-Archive"
    Project     = "S3-Log-Archive"
    Environment = "Demo"
  }
}

# 2. Block Public Access
resource "aws_s3_bucket_public_access_block" "log_archive" {
  bucket = aws_s3_bucket.log_archive.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "log_archive" {
  bucket = aws_s3_bucket.log_archive.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 4. Configure Lifecycle Expiration
resource "aws_s3_bucket_lifecycle_configuration" "log_archive" {
  bucket = aws_s3_bucket.log_archive.id

  rule {
    id     = "expire-old-logs"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    expiration {
      days = 30
    }
  }

  depends_on = [
    aws_s3_bucket_public_access_block.log_archive
  ]
}

# Output Bucket Name
output "bucket_name" {
  value = aws_s3_bucket.log_archive.bucket
}

# Output Bucket ARN
output "bucket_arn" {
  value = aws_s3_bucket.log_archive.arn
}

