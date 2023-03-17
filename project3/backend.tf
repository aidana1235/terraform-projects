terraform {
  backend "s3" {
    bucket         = "aidanas12345"
    key            = "state1.tf"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "locker"
  }
}