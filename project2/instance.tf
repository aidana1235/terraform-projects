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

resource "aws_instance" "aid-instance1" {
  ami           = data.aws_ami.amazon-linux-2.id
  subnet_id     = aws_subnet.my-private-subnet.id
  instance_type = var.instance_type
}

resource "aws_instance" "aid-instance2" {
  ami           = data.aws_ami.amazon-linux-2.id
  subnet_id     = aws_subnet.my-public-subnet.id
  instance_type = var.instance_type
  user_data = file("entry-script.sh")
  vpc_security_group_ids      = [aws_security_group.allow_ssh_and_http.id]
associate_public_ip_address = true         
            
}

resource "aws_key_pair" "ins-key" {
  key_name   = "ins-key"
 # public_key = file("${var.public_key_location}")
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyyJa5GbP6yaToopFEeiFscD8eJhGkoGzetK/IM4Th9nynnLplPsnUwe60D7Nyk271EFMj4Hf6+4J6yNFjn4yKRm4uF/WboIajLRzXaEEibfiak4XssyM4vkXc8npv31SYlMt5MC0VC0H7u82zYzWZSmjv/TZKeS0ojvoJ9SC1huoe74WW32bkeLlstsXJB+zneyuUinu+QRyGa7zv4mhyfAP3G5ModxljlYZBakgL8nmZqcCrK64rvWgtsTXoxH2ov85Aj3TMuF3sJMZ/ipJU986/ecDdBXrfrwCtJwoMENT/PCVRb2WsE63tDYWZwqqUD07ZQmSeZAwF+/vBPidKDZXU3w3nOtFB1b3AS/tnmVHZAin4dczvcmpQ6n3NEycRNRFQRQVJiJXHO5FKf0y9LkfirxYFZJ/azqz6d3CLadjH0pA7j+Gpuo0o8LTdNzYf3T1BPNQS5+P5S8kpjKhPB2/Ew6Yv/HRFYVGCgaAGVI24SVtBpKlE+ZJov1CkmgU= user@DESKTOP-ELFFH7D"
  
  
  
  
  
  
  
  
  
  
}









































































































































