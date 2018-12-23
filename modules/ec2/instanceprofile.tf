## This template creates the instance profile
##

### IAM Instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "default-ec2profile"
  role  = "${aws_iam_role.ec2_role.name}"
}
