## This template creates the instance profile
##

### IAM Instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "ec2_profile"
  roles = ["${aws_iam_role.ec2_role.name}"]
}
