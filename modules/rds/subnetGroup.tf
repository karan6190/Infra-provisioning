resource "aws_db_subnet_group" "public_subnets" {
  name       = " ${var.VPC_NAME}_${var.ENV}_public_subnets group"
  subnet_ids = ["${var.public_subnets-1}", "${var.public_subnets-2}"]

  tags {
    Name = "Public subnet groups for ${var.VPC_NAME}-${var.ENV} "
  }
}

resource "aws_db_subnet_group" "private_subnets" {
  name       = "${var.VPC_NAME}_${var.ENV}_private_subnets group"
  subnet_ids = ["${var.private_subnets-1}", "${var.private_subnets-2}"]

  tags {
    Name = "Private subnet groups for ${var.VPC_NAME}-${var.ENV} "
  }
}