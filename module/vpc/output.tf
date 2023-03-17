output "vpc_id" {
    value = aws_vpc.my-vpc.id
}

output "private_subnet_ids" {
    value = aws_subnet.my-private-subnet.id
}

output "public_subnet_ids" {
    value = aws_subnet.my-public-subnet.id
}