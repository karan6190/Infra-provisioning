## This Template creates the Default security group and 
##

## Creating security Group

resource "aws_security_group" "instance-SG" {
  vpc_id = "${var.vpc_id}"
  name = "${var.VPC_NAME}-${var.applicationname}-${var.ENV}-SG"
  description = "security group to access to Instance over HTTP and SSH and all outbound traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }  
tags {
    Name = "${var.VPC_NAME}-${var.applicationname}-${var.ENV}-SG"
  }
}