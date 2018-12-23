##This template creates a Autoscaling group
##

##Autoscaling Group
resource "aws_autoscaling_group" "default-autoscaling-group" {
name                      = "default-${var.VPC_NAME}-${var.ENV}-autoscaling-group"
vpc_zone_identifier       = ["${var.subnets_id}"]
launch_configuration      = "${aws_launch_configuration.default-launchconfig.name}"
load_balancers            = ["${var.load_balancers}"]
min_size                  = "${var.min_size}" 						#default is 1
max_size                  = "${var.max_size}"						#default is 2
health_check_grace_period = 300
health_check_type         = "EC2"
force_delete              = true
tag {
key = "Name"
value = "ec2 instance"
propagate_at_launch = true
}
}