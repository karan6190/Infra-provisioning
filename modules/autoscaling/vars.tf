variable "AWS_REGION" {
  default = "us-east-1"
}

variable "ENV" {
  default = "dev"
}

variable "VPC_NAME" {
  description = "Name of the Product"
}

variable "subnets_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "public key"
}

variable "security_groups" {
  description = " Ec2 attached Security group"
}

variable "load_balancers" {
  description = "Ec2 attached loadblancer"
}

variable "min_size" {
  default = "1"
}

variable "max_size" {
  default = "2"
}

variable "higherthreshold" {
  default = "70"
}

variable "lowerthreshold" {
  default = "20"
}