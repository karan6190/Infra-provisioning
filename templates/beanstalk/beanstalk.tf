data "terraform_remote_state" "infra" {
    backend = "local"
    config {
        path = "D:\\terraform_examples\\distruptor\\prod\\terraform.tfstate"
    }
}

module "eb" {
  source              = "../modules/beanstalk"
  ENV                 = "${var.ENV}"										                     #productEnv
  AWS_REGION          = "${var.AWS_REGION}"
  VPC_NAME            = "${var.VPC_NAME}"		                                                 #productName
  appname             = "${var.appname}"                                                         #Application Name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.12.6 running Docker 18.06.1-ce"           #default is Single Docker eb
  InstanceType        = "t2.micro"											                     #default is t2.micro
  ListenerProtocol    = "HTTP"												                     # default is HTTP, Valid values are HTTP, TCP
  InstancePort        = "80"												                     # default is 80
  #sslcert             = ""
  minsize             = "2"												                         #default is 1
  maxsize             = "4"												                         #default is 2
  LowerThreshold      = "20" 												                     #default is 20
  UpperThreshold      = "70"												                     #default is 70
  healthcheckurl      = "HTTP:80/"                                                               #default is HTTP:80/
  vpc_id              = "${data.terraform_remote_state.infra.vpc_id}"
  private_subnet-1    = "${data.terraform_remote_state.infra.private_subnets-1}"
  private_subnet-2    = "${data.terraform_remote_state.infra.private_subnets-2}"
  pubkey              = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEApTZ5aSRGFe23ZBSV8SNDCky8JxEDnMLGmq5qi1FGcBe1W4k8In+jmeLVvhQ+RqPKRS97DNihoJ1bT99jdtFKGUBNTCGk+SF9+xCszmx2UBRUrPJyKJsZlnN1E3V9KwkWIlsvpziMdgCCrmzw/aBn28fxeK7lIV04XmVTl1wHVMBqGo4ur8ueYj7lHNJtAu0AY6BUadcHLl42bcw1UtlTEFSYFy9pUHDzjsSVx2OFA0nntECaqEUf8xbG1VmU3J4h3rI0Omufd9rcovu2fmL0yrk4ls8B7R+Ss9GVNR9hMe7Ec5/zTiQNdpqKmuLToqxV8jnd5zL26zv4MnfZZoD3nQ== rsa-key-karan"  
 }