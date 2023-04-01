module "aws_s3_bucket" {
  source = "git::https://github.com/aidana1235/s3-bucket-module.git?ref=v0.0.1"
  bucket_name = "aidrinks00"
}