variable "AWS_REGION" {
  default = "us-east-1"
}

variable VPC_NAME {
  description = "Name of the product"
}
variable ENV {
  default = "dev"
}
variable applicationName {
  description = "Name of the Application"
}
variable subnets{
  
}
variable vpc_id {

}
variable instance_port {
  default = 80
}
variable instance_protocol {
  default = "http"
}
variable health_check_url {
  default = "HTTP:80/"
}
variable instance_id {
  description = "EC2 instance id to which lb needs to be attached"
}
variable lb_port {
  default = 80
}
variable sslcert {
  description = "ssl certification arn"
}
#variable GW {
  #description = "Ensure the VPC has an Internet gateway"
#}