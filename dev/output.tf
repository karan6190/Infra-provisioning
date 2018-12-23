##Output of the designed INFRA

output "vpc_id" {
  value       = "${module.main-vpc.vpc_id}"
  description = "designed VPC ID"
}

output "public_subnets-1" {
  value       = "${module.main-vpc.public_subnets-1}"
}

output "public_subnets-2" {
  value       = "${module.main-vpc.public_subnets-2}"
  
}
output "private_subnets-1" {
  value       = "${module.main-vpc.private_subnets-1}"
}

output "private_subnets-2" {
  value       = "${module.main-vpc.private_subnets-2}"
  
}