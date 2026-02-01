resource "aws_autoscaling_group" "asg" {
  min_size         = 2
  max_size         = 5
  desired_capacity = 3

  vpc_zone_identifier = data.aws_subnets.supported.ids

  target_group_arns = [aws_lb_target_group.tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "tf-asg-instance"
    propagate_at_launch = true
  }
}
