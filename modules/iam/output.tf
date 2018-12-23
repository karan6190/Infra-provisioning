### Taking the output of the designed Role

output "instance_profile" {
  description = "ec2 default instance profile"
  value       = "${aws_iam_instance_profile.ec2_profile.name}"
}