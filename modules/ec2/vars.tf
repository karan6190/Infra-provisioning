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
variable "number_of_instances" {
  default = "1"
}

variable "subnet_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "user_data" {
  description = "Installing packages while initializing Instance"
}

variable "instance_name" {
  description = "Name of the Instance"
} 

variable "instance_root_volume_size" {
  description = "This is the size of the disk the instance is launched with. Defaulted to 8GB"
  default = "8"
}

variable "instance_root_volume_type" {
  description = "This is the EBS volume type of the disk the instance is launched with. Defaults to standard. Options: standard, gp2"
  default = "standard"
}

variable "instance_root_volume_provisioned_io" {
  description = "This is the provisioned IO the root volume the instance is launched with."
  default = "0"
}

variable "instance_root_volume_delete_on_termination" {
  description = "This setting controls when the instance is terminated, if the EBS volume terminates itself as well."
  default = "true"
} 

variable "pubkey" {}

variable "ENV" {
  default = "dev"
}
variable "VPC_NAME" {
  description = "Name of the Product"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "applicationname" {
  default = "defaultEc2"
}
