output "ami" {
  value = aws_instance.aid-instance.*.ami
}

output "instance_ip" {
  value = aws_instance.aid-instance.public_ip
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.my_bucket
}
