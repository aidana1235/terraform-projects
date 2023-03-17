provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags= {
    Name: "${var.env_prefix}-vpc"
  }
}

module "ins-module" {
  source = "modules/subnet"
  subnet_cidr_block = var.subnet_cidr_block 
  availability_zone = var.availability_zone
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.my-vpc.id
  route_table_id = aws_vpc.my-vpc.route_table_id
}


resource "aws_subnet" "my-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.subnet_cidr_block
    tags = {
        Name: "${var.env_prefix}-subnet-1"
    }
  
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name: "${var.env_prefix}-igw"
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
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.main-rtb.id
}



resource "aws_security_group" "my-sg" {
  name = "my-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = ["amazon"]
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

 variable instance_type {}

resource "aws_instance" "project-inst" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  subnet_id = module.my-subnet.subnet.id
  associate_public_ip_address = true
  key_name = "devops"
  user_data = file("entry-script.sh")
  vpc_security_group_ids  = [aws_security_group.my-sg.id]
              
}













