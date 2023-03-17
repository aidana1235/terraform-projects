resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags= {
    Name: "${var.env_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name: "${var.env_prefix}-igw"
    }
}

resource "aws_subnet" "my-public-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.cidr_block_public
    availability_zone = var.availability_zone_public
    tags = {
        Name: "${var.env_prefix}-subnet-1"
    }
  
}

resource "aws_subnet" "my-private-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.cidr_block_private
    availability_zone = var.availability_zone_private
    tags = {
        Name: "${var.env_prefix}-subnet-2"
    }
  
}

resource "aws_route_table" "main-rtb" {
   vpc_id = aws_vpc.my-vpc.id 

     route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
     }
     tags = {
        Name: "${var.env_prefix}-main-rbt"
     }
}     

resource "aws_route_table_association" "public_table_association" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.main-rtb.id
}