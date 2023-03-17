resource "aws_autoscaling_group" "asg" {
  name = "${aws_launch_configuration.launch_configuration.name}-asg"
  launch_configuration = aws_launch_configuration.launch_configuration.name
  vpc_zone_identifier = ["subnet-0ee540acbb8f1c56b" ]



  min_size         = 1
  desired_capacity = 2
  max_size         = 3

}