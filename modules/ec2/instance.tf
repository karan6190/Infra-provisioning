##This template creates an EC2 instance.

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

###Ubuntu AMI
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

}

###Creating EC2 instance
resource "aws_instance" "ec2_instance" {
    #ami                    = "${data.aws_ami.amazon_linux.id}"                #for AWS linux AMI
	ami                    = "${data.aws_ami.ubuntu.id}" 
### if you want to use any other amazon linux the comment the top one and uncomment the lower one.
    #AMIS                  = "${lookup(var.aws_AMIS, var.AWS_REGION)}"
	
    count                  = "${var.number_of_instances}"						#no of instances to be launched, default is 1
	
    subnet_id              = "${var.subnet_id}"								    #subnets where you have to launch the Instance
	
    instance_type          = "${var.instance_type}"								#default is t2.micro
	
    vpc_security_group_ids = ["${aws_security_group.instance-SG.id}"]

    root_block_device      = {
    volume_type            = "${var.instance_root_volume_type}"
    volume_size            = "${var.instance_root_volume_size}"
    iops                   = "${var.instance_root_volume_provisioned_io}"
    delete_on_termination  = "${var.instance_root_volume_delete_on_termination}"
  }

    iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.name}"		#Administrative Access
  
    user_data              = "${var.user_data}"						            #user data for installing any packages while init. the Instance
	
### the public SSH key
  key_name                 = "${aws_key_pair.mykeypair.key_name}"

    tags {
        Name               = "${var.instance_name}-${count.index}"
    }
}