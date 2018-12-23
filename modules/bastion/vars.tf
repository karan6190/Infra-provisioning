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
variable vpc_id {}
variable public_subnets {}
variable "ENV" {
  default = "dev"
}
variable "VPC_NAME" {
  description = "Name of the Product"
}
