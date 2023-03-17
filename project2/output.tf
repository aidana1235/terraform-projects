output "vpc_id" {
    value = aws_vpc.my-vpc.id 
}

output "security_group_id" {
    value = aws_security_group.allow_ssh_and_http.id
}


output "instance_ip_1" {
  value = aws_instance.aid-instance1.id
}

output "instance_ip_2" {
  value = aws_instance.aid-instance2.id
}


output "ami" {
  value = data.aws_ami.amazon-linux-2.id
}
