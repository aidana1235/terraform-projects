resource "aws_elb" "aidlb" {
  name = "aidLB"
  subnets = [aws_subnet.my-public-subnet.id]

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
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags = {
    "Name" = "terraformLB"
  }
}

resource "aws_lb_target_group" "aidlb" {
  name        = "aid-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.my-vpc.id}"
  target_type = "instance"
}


