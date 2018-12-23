variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0ff8a91507f77f867"
	us-east-2 = "ami-0b59bfac6be064b78"
	us-west-1 = "ami-a0cfeed8"
    us-west-2 = "ami-0bdb828fd58c52235"
  }
}
variable "pubkey" {
  description = "Public Key"
}
variable "InstanceType" {
  default = "t2.micro"
}
variable "ListenerProtocol" {
  default = "HTTP"
}
variable "InstancePort" {
  default = "80"
}
#variable "sslcert" {
  #description = "SSL certificate ARN"
#}
variable "minsize" {
  default = "1"
}
variable "maxsize" {
  default = "2"
}
variable "LowerThreshold" {
  default = "20"
}
variable "UpperThreshold" {
  default = "70"
}
variable "healthcheckurl" {
  default = "HTTP:80/"
}
variable "ENV" {
  default = "dev"
}
variable "VPC_NAME" {
  description = "Product Name"
}
variable "appname" {
  description = "Application Name"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2018.03 v2.12.6 running Docker 18.06.1-ce"
}
variable "vpc_id" {
  description = "VPC ID"
}
variable "private_subnet-1" {}

variable "private_subnet-2" {}