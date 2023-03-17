provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "aidanasins" {
  instance_type = "t2.micro"
  ami           = "ami-005f9685cb30f234b"
  key_name      = "devops"
  tags = {
    Name = "aidanasins1"
  }
}
