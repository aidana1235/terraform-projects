data "aws_ami" "amazon-linux-1" {
 provider = aws.east
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

data "aws_ami" "amazon-linux-2" {
 provider = aws.west
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

data "aws_subnet" "subnet_name" {
   id = "subnet-09039726322438cfd"
}


resource "aws_instance" "aidank5" {
  ami           = "${data.aws_ami.amazon-linux-1.id}"
  subnet_id     = data.aws_subnet.subnet_name.id
  provider = aws.east
  instance_type = "t2.nano"
tags = {
    Name = "aid-instance"
  }
}
  
resource "aws_instance" "aidanks1" {
 ami   = "${data.aws_ami.amazon-linux-2.id}"
 provider = aws.west
 instance_type = "t2.nano"
tags = {
    Name = "aid-instance"
  }
}


