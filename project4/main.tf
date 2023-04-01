provider "aws" {
  region = "us-east-1"
}


# resource  "aws_s3_bucket" "bucketforimpr" {
  # bucket = "bucketfortrf"
  # force_destroy  = false
  # tags = {
    # Environment = var.Environment  
    # Bucket_name  = var.Bucket_name
  #  }
# }


resource "aws_s3_bucket" "bucketforrepl" {
  bucket = "bucketforrepl"
  
}


