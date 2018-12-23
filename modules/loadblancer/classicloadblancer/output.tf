output "dns_name" {
  description = "The DNS name of the created ELB."
  value = "${aws_elb.load_balancer.dns_name}"
}

output "loadblancer_SG" {
  description = "The ID of the ELB security group."
  value = "${aws_security_group.elb_SG.id}"
}

output "loadbalancer_name" {
  description = "name of the loadblancer"
  value = "${aws_elb.load_balancer.name}"
}