resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    "Name" = "Aidbucket"
  }

  
  lifecycle_rule {
    id      = "log"   # log its rule name
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

  }
}