# Output endpoint (hostname:port) of the RDS instance
output "rds-endpoint" {
  description = "RDS ${var.rdsname} endpoint"
  value       = "${aws_db_instance.rds.endpoint}"
}

# Output the ID of the Public Subnet Group
output "public_subnet_group" {
  value = "${aws_db_subnet_group.public_subnets.id}"
}

# Output the ID of the Subnet Group
output "private_subnet_group" {
  value = "${aws_db_subnet_group.private_subnets.id}"
}
