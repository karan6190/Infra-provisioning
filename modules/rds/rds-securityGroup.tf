resource "aws_security_group" "rds-SG" {
  name   = "RDS-${var.VPC_NAME}-${var.ENV}-SG"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.public_subnets-1}"]
  }
  
  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.private_subnets-1}"]
  } 

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.private_subnets-2}"]
  }

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.public_subnets-2}"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}