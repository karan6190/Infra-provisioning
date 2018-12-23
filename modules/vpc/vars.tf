
variable "ENV" {
  default = "dev"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "VPC_NAME" {}

variable "az1" {
  description = "availability zone 1"
}

variable "az2" {
  description = "availability zone 2"
} 
