## This Template creates Auto-scaling policy
## for launching the Instances


### scale up alarm
resource "aws_autoscaling_policy" "scaleup-policy" {
name                            = "scaleup-policy"
autoscaling_group_name          = "${aws_autoscaling_group.default-autoscaling-group.name}"
adjustment_type                 = "ChangeInCapacity"
scaling_adjustment              = "1"
cooldown                        = "300"
policy_type                     = "SimpleScaling"
}

### cloudwatch metric alarm
resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaleup" {
alarm_name                      = "cpu-alarm-scaleup"
alarm_description               = "high threshold alarm for scaling up Instances"
comparison_operator             = "GreaterThanOrEqualToThreshold"
evaluation_periods              = "2"
metric_name                     = "CPUUtilization"
namespace                       = "AWS/EC2"
period                          = "120"
statistic                       = "Average"
threshold                       = "${var.higherthreshold}"
dimensions  = {
"AutoScalingGroupName"          = "${aws_autoscaling_group.default-autoscaling-group.name}"
}
actions_enabled                 = true
alarm_actions                   = ["${aws_autoscaling_policy.scaleup-policy.arn}"]
}


### scale down
resource "aws_autoscaling_policy" "scaledown-policy" {
name                            = "example-cpu-policy-scaledown"
autoscaling_group_name          = "${aws_autoscaling_group.default-autoscaling-group.name}"
adjustment_type                 = "ChangeInCapacity"
scaling_adjustment              = "-1"
cooldown                        = "300"
policy_type                     = "SimpleScaling"
}

### cloudwatch metric alarm
resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown" {
alarm_name                      = "cpu-alarm-scaledown"
alarm_description               = "lower threshold alarm for scaling down Instances"
comparison_operator             = "LessThanOrEqualToThreshold"
evaluation_periods              = "2"
metric_name                     = "CPUUtilization"
namespace                       = "AWS/EC2"
period                          = "120"
statistic                       = "Average"
threshold                       = "${var.lowerthreshold}"
dimensions                      = {
"AutoScalingGroupName"          = "${aws_autoscaling_group.default-autoscaling-group.name}"
}
actions_enabled                 = true
alarm_actions                   = ["${aws_autoscaling_policy.scaledown-policy.arn}"]
}