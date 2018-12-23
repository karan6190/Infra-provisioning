##This template creates the Autoscaling group and Launch configuration 
##with min size of 1 instances and max size of 2 Instance.
##

###Autoscaling
module "asg" {
  source                              = "../modules/autoscaling/"
  ENV                                 = "dev"
  AWS_REGION                          = "${var.AWS_REGION}"
  VPC_NAME                            = "fusion"
  subnets_id                          = "${module.main-vpc.public_subnets-2}"
  instance_type                       = "t2.micro"									# default is t2.micro
  key_name                            = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEApTZ5aSRGFe23ZBSV8SNDCky8JxEDnMLGmq5qi1FGcBe1W4k8In+jmeLVvhQ+RqPKRS97DNihoJ1bT99jdtFKGUBNTCGk+SF9+xCszmx2UBRUrPJyKJsZlnN1E3V9KwkWIlsvpziMdgCCrmzw/aBn28fxeK7lIV04XmVTl1wHVMBqGo4ur8ueYj7lHNJtAu0AY6BUadcHLl42bcw1UtlTEFSYFy9pUHDzjsSVx2OFA0nntECaqEUf8xbG1VmU3J4h3rI0Omufd9rcovu2fmL0yrk4ls8B7R+Ss9GVNR9hMe7Ec5/zTiQNdpqKmuLToqxV8jnd5zL26zv4MnfZZoD3nQ== rsa-key-karan"
  security_groups                     = "${module.EC2.default_ec2_sg}"
  load_balancers                      = "${module.loadblancer.loadbalancer_name}"
  min_size                            = "1"											# default is 1
  max_size                            = "2"                                         # default is 2
  higherthreshold                     = "70"										# default is 70
  lowerthreshold                      = "30" 										# default is 30
}