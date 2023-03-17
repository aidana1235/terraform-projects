provider "aws" {
  region = "us-east-1"
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

#define autoscaling launch config
resource "aws_launch_configuration" "aid-launch-config" {
    name = "aid-launch-config"
    image_id = data.aws_ami.amazon-linux-2.id
    security_groups = [aws_security_group.allow_ssh_and_http.id]
    instance_type = var.instance_type
    user_data = file("entry-script.sh")
     associate_public_ip_address = true

}

#define autoscaling grop
resource "aws_autoscaling_group" "aid-autoscaling" {
    name = "aid-autoscaling"
    vpc_zone_identifier = [aws_subnet.my-public-subnet.id]
    launch_configuration = aws_launch_configuration.aid-launch-config.name
    min_size = 1
    max_size = 3
    load_balancers = [aws_elb.aidlb.name]  
    health_check_grace_period = 70
    health_check_type = "EC2"
    force_delete = true
    tag {
        key = "Name"
        value = "aid-ec2_instance"
        propagate_at_launch = true

    }
}
