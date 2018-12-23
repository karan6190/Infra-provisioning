module "rds" {
  source                  = "../modules/rds"
  ENV                     = "dev"										#dev
  AWS_REGION              = "${var.AWS_REGION}"						    #us-east-1
  VPC_NAME                = "fusion"
  vpc_id                  = "${module.main-vpc.vpc_id}"
  public_subnets-1        = "${module.main-vpc.public_subnets-1}"
  public_subnets-2        = "${module.main-vpc.public_subnets-2}"
  private_subnets-1       = "${module.main-vpc.private_subnets-1}"
  private_subnets-2       = "${module.main-vpc.private_subnets-2}"
  multi_az                = "false"  									#default false
  backup_retention_period = 7 									        #default 7
  publicly_accessible     = false 								        #default false
  minor_version_upgrade   = true 								        #default true
  major_version_upgrade   = false								        #default false
  storage                 = "20"								        #default 20
  engine				  = "mysql"								        #default mysql
  engine_version          = "5.7"                                       #default 5.7
  instance_type           = "db.t2.small"                               #default db.t2.small
  rdsname				  = "tesedb"                                    #database identifier
  dbname                  = "testTerraform"
  dbusername              = "terraform"
  dbpassword              = "${var.dbpassword}"
  
}