resource "aws_launch_configuration" "launch_configuration" {
  name_prefix = "launch_configuration"

  image_id                    = "ami-005f9685cb30f234b"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.allow_ssh_and_http.id]
  associate_public_ip_address = true
  user_data                   = file("data.sh")

  lifecycle {
    create_before_destroy = true
  }
}