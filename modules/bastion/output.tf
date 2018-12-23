### Taking the output of the bastion-SG and designed Role

output "bastion-SG" {
  description = "${var.VPC_NAME}-${var.ENV} SSH Security Group"
  value       = "${aws_security_group.allow-ssh.id}"
}

output "instance_profile" {
  description = "ec2 default instance profile"
  value       = "${aws_iam_instance_profile.bastion_profile.name}"
}