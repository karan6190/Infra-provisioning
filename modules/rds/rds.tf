variable "apply_immediately" {
  default = "false"
  description = "Whether to deploy changes to the database immediately (true) or at the next maintenance window (false)."
}

resource "aws_db_instance" "rds" {
  allocated_storage          = "${var.storage}"
  storage_type               = "gp2"
  engine                     = "${var.engine}"
  engine_version             = "${var.engine_version}"
  instance_class             = "${var.instance_type}"
  identifier                 = "${var.rdsname}-${var.VPC_NAME}-${var.ENV}"
  name                       = "${var.dbname}"
  username                   = "${var.dbusername}"
  password                   = "${var.dbpassword}"
  multi_az                   = "${var.multi_az}"
  backup_retention_period    = "${var.backup_retention_period}"
  publicly_accessible        = "${var.publicly_accessible}"
  db_subnet_group_name       = "${aws_db_subnet_group.private_subnets.name}"
  vpc_security_group_ids     = ["${aws_security_group.rds-SG.id}"]
  apply_immediately          = "${var.apply_immediately}"
  skip_final_snapshot        = true
  storage_encrypted          = true
  final_snapshot_identifier  = "${var.VPC_NAME}-${var.ENV}-final-snapshot-${var.rdsname}"
  auto_minor_version_upgrade = "${var.minor_version_upgrade}"
  allow_major_version_upgrade= "${var.major_version_upgrade}"
}