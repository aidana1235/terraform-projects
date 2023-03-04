output "ami" {
  value = aws_instance.aid-instance.*.ami
}

output "instance_ip" {
  value = aws_instance.aid-instance.*.public_ip
}

