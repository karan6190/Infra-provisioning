###This template creates the Classic loadblancer with default
###LB port 80 and 443.


###Creating Classic Loadblancer
resource "aws_elb" "load_balancer" {
  name = "${var.VPC_NAME}-${var.ENV}-${var.applicationName}"
  
    #vpc_id  = "${var.vpc_id}"

  # The same availability zone as our instance
  subnets = ["${var.subnets}"]

  security_groups = ["${aws_security_group.elb_SG.id}"]

  listener {
    instance_port     = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = "${var.lb_port}"					#default port will be 80
    lb_protocol       = "${var.instance_protocol}"			#default protocol will 'http'
  }
  
  listener {
    instance_port      = "${var.instance_port}"
    instance_protocol  = "${var.instance_protocol}"
    lb_port            = "443"
    lb_protocol        = "HTTPS"
	ssl_certificate_id = "${var.sslcert}"
  }
  


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "${var.health_check_url}"
    interval            = 30
  }

  # The instance is registered automatically

  instances                   = ["${var.instance_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}
