##This Template creates the LaunchConfiguration
##

### AWS linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

### launch configuration
resource "aws_launch_configuration" "default-launchconfig" {
name_prefix            = "${var.VPC_NAME}-${var.ENV}-launchconfig"
image_id               = "${data.aws_ami.amazon_linux.id}"
### if you want to use any other amazon linux the comment the top one and uncomment the lower one.
#ami                   = "${lookup(var.aws_AMIS, var.AWS_REGION)}"
instance_type          = "${var.instance_type }"                              #default is t2.micro
key_name               = "${var.key_name}"
security_groups        = ["${var.security_groups}"]
}
