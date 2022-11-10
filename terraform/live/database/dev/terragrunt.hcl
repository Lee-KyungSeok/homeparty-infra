terraform {
  source = "../../..//live/database/manifests"
}

include "backend" {
  path           = "../../backend.hcl"
  expose         = true
}

locals {
  env_vars = read_terragrunt_config("env.hcl")
}

inputs = {
  aws_region  = "ap-northeast-2"
  aws_profile  = local.env_vars.locals.aws_profile
  environment = "dev"

  network_remote_states = {
    hostname     = local.env_vars.locals.tfc_hostname,
    organization = local.env_vars.locals.tfc_organization,
    workspaces   = "homeparty-dev-network",
  }

  # RDS
  rds_engine         = "mysql"
  rds_engine_version = "8.0"

  rds_port           = 3306
#  rds_username       = var.rds_username
#  rds_password       = var.rds_password
  rds_instance_class = "db.t4g.micro"

  rds_storage_type      = "gp2"
  rds_allocated_storage = 20
  max_allocated_storage = 1000

  rds_publicly_accessible = false
  rds_availability_zone   = "ap-northeast-2a"

  rds_performance_insights_enabled = false
  rds_monitoring_interval          = 0

  rds_backup_retention_period = 7
  rds_backup_window           = "19:00-20:00"

  rds_apply_immediately   = true
  rds_deletion_protection = false
  rds_skip_final_snapshot = true
  rds_final_snapshot_identifier = null

  rds_parameter_group_family   = "mysql8.0"
  db_parameter_max_connections = 40
}