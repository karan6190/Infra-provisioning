##This template creates the AWS Elastic Beanstalk

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

###Application Name
resource "aws_elastic_beanstalk_application" "app" {
  name = "${var.appname}"
  description = "beanstalk Application"
}

###Beanstalk
resource "aws_elastic_beanstalk_environment" "application" {
  name                = "${var.VPC_NAME}-${var.ENV}-${var.appname}"
  application         = "${aws_elastic_beanstalk_application.app.name}"
  solution_stack_name = "${var.solution_stack_name}"
  cname_prefix        = "${var.VPC_NAME}-${var.ENV}-${var.appname}"
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${var.vpc_id}"
  }

###subnets
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${var.private_subnet-1}, ${var.private_subnet-2}"
  }

###AssociatePublicIpAddress
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "false"
  }

###IamInstanceProfile
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "default-ec2profile"
  }

###ImageId
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "ImageId"
    value     = "${data.aws_ami.amazon_linux.id}"
  }

###SecurityGroups
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "${aws_security_group.beanstalk-SG.id}"
  }

###KeyName
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "${aws_key_pair.mykeypair.key_name}"
  }

###InstanceType
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "${var.InstanceType}"									#default is t2.micro
  }

###ServiceRole
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }

###ELBScheme
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }

###CrossZone
  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }

###ListenerProtocol
  setting {
    namespace = "aws:elb:listener"
    name      = "ListenerProtocol"
    value     = "${var.ListenerProtocol}"						#default is HTTP, valid values HTTP, TCP
  }

###InstancePort
  setting {
    namespace = "aws:elb:listener"
    name      = "InstancePort"
    value     = "${var.InstancePort}"						    #default is HTTP, valid values HTTP, TCP
  }

###HTTPS ListenerProtocol
  setting {
    namespace = "aws:elb:listener"
    name      = "ListenerProtocol"
    value     = "443"
  }

###HTTPS InstancePort
  setting {
    namespace = "aws:elb:listener:443"
    name      = "InstancePort"
    value     = "80"
  }

###SSL
  #setting {
    #namespace = "aws:elb:listener:443"
    #name      = "SSLCertificateId"
    #value     = "${var.sslcert}"
  #}

### AZ's
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any 2"
  }

###Min Size
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "${var.minsize}"								#default is 1
  }

###MaxSize
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "${var.maxsize}"								#default is 2
  }

###RollingUpdate
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }

###RollingUpdateEnabled
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
  }

###LowerThreshold
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = "${var.LowerThreshold}"							#default is 20
  }

###CPUUtilization
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "CPUUtilization"
  }

###Unit
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "Percent"
  }

###UpperThreshold
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = "${var.UpperThreshold}"							#default is 70
  }

###Healthcheck URL
  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "${var.healthcheckurl}"							#default is HTTP:80/
  }
}
