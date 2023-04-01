provider "aws" {
    region = "us-east-1"
  
}
resource "aws_s3_bucket" "dev-bucket00" {
    bucket = "dev-bucket00${random_pet.name.id}"

    tags = {
      Name = "dev-bucket00"
}
  
}

resource "random_pet" "name" {
  length = 8
}

output "s3_bucket_name" {
    value = aws_s3_bucket.dev-bucket00.bucket
}