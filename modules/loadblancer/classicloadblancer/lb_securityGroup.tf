###This template creates the default SG of Classic loadblancer
###to access the elb over http

##
resource "aws_security_group" "elb_SG" {
  name        = "${var.VPC_NAME}-${var.ENV}-default-elb_sg"

  vpc_id = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 433
    to_port     = 433
    protocol    = "https"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ensure the VPC has an Internet gateway or this step will fail
  #depends_on = ["${var.GW}"]
}