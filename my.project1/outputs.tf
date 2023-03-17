output "aws_ami_id" {
  value = data.aws_ami.amazon-linux-2.id
  
}

output "instance-public-ip" {
    value = aws_instance.project-inst.public_ip
}