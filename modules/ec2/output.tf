### Taking the output of the designed EC2 Instance and instance profile

output "instance_id" {
  description = "${var.VPC_NAME}-${var.ENV} VPC ID"
  #value       = "${element(aws_instance.ec2_instance.*.id,0)}"
  value       = "${aws_instance.ec2_instance.*.id}"
}

output "instance_profile" {
  description = "ec2 default instance profile"
  value       = "${aws_iam_instance_profile.ec2_profile.name}"
}

output "default_ec2_sg" {
  description = "default security group of ec2"
  value       = "$ {aws_security_group.instance-SG.id}"
}