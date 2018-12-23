### Taking the output of the designed VPC and Subnets
output "vpc_id" {
  description = "${var.VPC_NAME}-${var.ENV} VPC ID"
  value       = "${aws_vpc.main-vpc.id}"
}

output "public_subnets-1" {
  description = "${var.VPC_NAME}-${var.ENV} Public Subnet 1 ID"
  value       = "${aws_subnet.public-subnet-1.id}"
}
output "public_subnets-2" {
  description = "${var.VPC_NAME}-${var.ENV} Public Subnet 2 ID"
  value       = "${aws_subnet.public-subnet-2.id}"
}

output "private_subnets-1" {
  description = "${var.VPC_NAME}-${var.ENV} Private Subnet 1 ID"
  value       = "${aws_subnet.private-subnet-1.id}"
}

output "private_subnets-2" {
  description = "${var.VPC_NAME}-${var.ENV} Private Subnet 2 ID"
  value       = "${aws_subnet.private-subnet-2.id}"
}
output "internetgateway" {
  description = "${var.VPC_NAME}-${var.ENV} internetGateway"
  value       = "${aws_internet_gateway.main-gw.id}"
}