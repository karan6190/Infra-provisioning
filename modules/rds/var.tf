variable "ENV" {
  default = "dev"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "vpc_id" {}

variable "VPC_NAME" {}

variable "storage" {
  description = "The allocated storage in gibibytes."
  default     = "20"
}
variable "engine" {
  description = "Database engine name"
  default     = "mysql"
}

variable "engine_version" {
  default     = "5.7"
}

variable "instance_type"  {
  description = "The instance type of the RDS instance"
  default     = "db.t2.small"
}

variable "rdsname" {
  description = "A unique name of RDS instance"
}

variable "dbname" {
  description = "The name of the database to create when the DB instance is created."
}

variable "dbusername" {
  description = "Username for the master DB user"
}
 variable "dbpassword" {}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 7
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default is false."
  default     = false
}

variable "minor_version_upgrade" {
  default     = true
}

variable "major_version_upgrade" {
  default     = false
}

variable public_subnets-1 {}

variable public_subnets-2 {}

variable private_subnets-1 {}

variable private_subnets-2 {}
