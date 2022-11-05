## Parameter Group
resource "aws_db_parameter_group" "rds_pg" {
  name        = "${local.project}-${var.environment}-parameter-group"
  description = "The parameter group for ${local.project}"

  family = var.rds_parameter_group_family

  dynamic "parameter" {
    for_each = var.db_parameter_max_connections == null ? [] : [var.db_parameter_max_connections]
    content {
      name         = "max_connections"
      value        = parameter.value
      apply_method = "immediate"
    }
  }

  tags = merge(local.base_tags)
}

resource "aws_db_option_group" "rds_option_group" {
  name                 = "${local.project}-${var.environment}-option-group"
  engine_name          = var.rds_engine
  major_engine_version = var.rds_engine_version
  tags                 = merge(local.base_tags)
}