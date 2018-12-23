variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-2"
}
variable "JENKINS_VERSION" {
  default = "2.150.1"
}
variable "TERRAFORM_VERSION" {
  default = "0.11.7"
}
variable "VPC_NAME" {
  default = "fusion"
}
variable "ENV" {
  default = "dev"
}