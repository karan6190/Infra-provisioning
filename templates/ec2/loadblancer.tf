##This template creates the classic loadblancer 
##with attached Ec2 instance
##Template by default creates the HTTPS listener and re-route the instance port to 443 port.  


###Clasic loadblancer
module "loadblancer" {
  source                              = "../modules/loadblancer/classicloadblancer"
  ENV                                 = "dev"										#default dev
  AWS_REGION                          = "${var.AWS_REGION}"						    #default us-east-1
  VPC_NAME                            = "fusion"
  applicationName                     = "Terraform"
  vpc_id                              = "${module.main-vpc.vpc_id}"
  subnets                             = "${module.main-vpc.public_subnets-2}"       # Lb needs to be in public subnets
  instance_port   		              = "80"									    #default 80
  instance_protocol                   = "http"										#default http
  health_check_url		              = "HTTP:80/"                                  #default "HTTP:80/"
  lb_port                             = "80"										#default 80
  sslcert				              = "arn:aws:acm:us-west-2:501442322082:certificate/f2a59205-dcba-41b2-b499-338a97c67306"											#for accessing over https
  instance_id                         = "${module.EC2.instance_id}"
  #GW  					              = "${module.main-vpc.internetgateway}"        #Ensure the VPC has an Internet gateway
  
}