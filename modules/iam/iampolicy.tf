## This templates creates the IAM policy

###IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "ec2-default-policy"
  description = "ec2 default policy"
  policy       = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
