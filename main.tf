
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



data "aws_subnet" "subnet_name" {
   id = "subnet-0ee540acbb8f1c56b"
}

locals {
  owner_name = "Aidan"
}


resource "aws_instance" "aid-instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  subnet_id     = data.aws_subnet.subnet_name.id
  instance_type = var.instance_type
  key_name = "devops"


tags = {
    Name = "aid-instance"
  }
}
#lifecycle {
 # prevent_destroy = false
#}

resource "aws_iam_user" "user" {
  name = var.username
}

resource "aws_elb" "aidlb" {
  name = var.elb_name
  availability_zones = var.az

  listener {
    instance_port = 8000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }


health_check {
    target = "HTTP:8000/"
    interval    = 30
    timeout     = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  cross_zone_load_balancing = true
  idle_timeout = var.timeout
  connection_draining = true
  connection_draining_timeout = var.timeout

  tags = {
    "Name" = "terraformLB"
  }
}
















































































































































































































































































































































































































































































