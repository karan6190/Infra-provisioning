## Sample Template for standalone Ec2 instance
##



###Ec2 Instance
module "jenkins" {
  source                              = "../modules/ec2/"
  ENV                                 = "${var.ENV}"
  AWS_REGION                          = "${var.AWS_REGION}"
  VPC_NAME                            = "${var.VPC_NAME}"
  applicationname                     = "jenkins"
  vpc_id                              = "${module.main-vpc.vpc_id}"
  number_of_instances                 = "1" 										# default is 1
  subnet_id                           = "${module.main-vpc.public_subnets-1}"       # Launching ec2 in public subnets
  instance_type                       = "t2.medium"                                  # default t2.micro
  user_data                           = "${file("userdata.sh")}"
  instance_name                       = "jenkins-server"
  instance_root_volume_size           = "20"   										# default is 8
  instance_root_volume_type           = "standard"                                  # default is standard
  instance_root_volume_provisioned_io = "0"
  pubkey                              = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEApTZ5Gmq5qi1FGcBe1W4k8In+jmeLVvhQ+RqPKRS97DNihoJ1bT99jdtFKGUBNTCGk+SF9+xCszmx2UBRUrPJyKJsZlnN1E3V9KwkWIlsvpziMdgCCrmzw/aBn28fxeK7lIV04XmVTl1wHVMBqGo4ur8ueYj7lHNJtAu0AY6BUadcHLl42bcw1UtlTEFSYFy9pUHDzjsSVx2OFA0nntECaqEUf8xbG1VmU3J4h3rI0Omufd9rcovu2fmL0yrk4ls8B7R+Ss9GVNR9hMe7Ec5/zTiQNdpqKmuLToqxV8jnd5zL26zv4MnfZZoD3nQ== rsa-key-karan"  
}
