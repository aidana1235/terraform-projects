
resource "aws_autoscaling_policy" "policy_up" {
  name                   = "policy_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.id
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up" {
  alarm_name          = "cpu_alarm_up"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.id
  }
}
