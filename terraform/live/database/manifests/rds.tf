locals {
  create_enhanced_monitoring = var.rds_monitoring_interval > 0 ? true : false
  writer_rds_record_name     = "main.writer.rds"
  reader_rds_record_name     = "main.reader.rds"
  rds_ingress_allow_cidrs    = toset(concat(data.terraform_remote_state.network.outputs.public_cidr, data.terraform_remote_state.network.outputs.private_cidr, data.terraform_remote_state.network.outputs.private_db_cidr))
}

# DB security Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${local.project}-${var.environment}-dbsubnet-group"
  description = "The subnets used for ${local.project} RDS deployments"

  subnet_ids = data.terraform_remote_state.network.outputs.private_db_subnets

  tags = merge({}, local.base_tags)
}

resource "aws_security_group" "rds_security_group" {
  name        = "${local.project}-${var.environment}-rds-sg"
  description = "${local.project} ${var.rds_engine} security group"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Name = "${local.project}-${var.environment}-rds-security-group"
    },
    local.base_tags,
  )
}

resource "aws_security_group_rule" "rds_sg_egress_all" {
  security_group_id = aws_security_group.rds_security_group.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}

resource "aws_security_group_rule" "rds_sg_ingress" {
  security_group_id = aws_security_group.rds_security_group.id
  cidr_blocks       = local.rds_ingress_allow_cidrs
  from_port         = var.rds_port
  to_port           = var.rds_port
  protocol          = "tcp"
  type              = "ingress"
  description       = "the ingress of security group"
}

# Monitoring
data "aws_iam_policy_document" "monitoring_rds_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "rds_enhanced_monitoring" {
  count              = local.create_enhanced_monitoring ? 1 : 0
  name               = "${local.project}-${var.environment}-rds-enhanced-monitoring"
  assume_role_policy = data.aws_iam_policy_document.monitoring_rds_assume_role.json

  tags = merge({}, local.base_tags)
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  count      = local.create_enhanced_monitoring ? 1 : 0
  role       = aws_iam_role.rds_enhanced_monitoring[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_db_instance" "main" {
  engine         = var.rds_engine
  engine_version = var.rds_engine_version

  identifier     = "${local.project}-${var.environment}-main-database"
  port           = var.rds_port
  username       = var.rds_username
  password       = var.rds_password
  instance_class = var.rds_instance_class

  storage_type          = var.rds_storage_type
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.max_allocated_storage
  iops                  = var.rds_storage_iops

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = var.rds_publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  availability_zone      = var.rds_availability_zone

  parameter_group_name = aws_db_parameter_group.rds_pg.name
  option_group_name    = aws_db_option_group.rds_option_group.name

  performance_insights_enabled    = var.rds_performance_insights_enabled
  performance_insights_kms_key_id = var.rds_performance_insights_kms_key_id
  monitoring_role_arn             = join("", aws_iam_role.rds_enhanced_monitoring.*.arn)
  monitoring_interval             = var.rds_monitoring_interval

  backup_retention_period  = var.rds_backup_retention_period
  backup_window            = var.rds_backup_window
  delete_automated_backups = true

  apply_immediately = var.rds_apply_immediately

  storage_encrypted = true

  auto_minor_version_upgrade = true

  deletion_protection = var.rds_deletion_protection
  skip_final_snapshot = var.rds_skip_final_snapshot
  final_snapshot_identifier = var.rds_final_snapshot_identifier

  tags = merge(local.base_tags)

}