variable "aws_region" {
  description = "The region of infra"
  type        = string
}

variable "aws_profile" {
  description = "The profile of infra"
  type        = string
}

variable "environment" {
  description = "The environment of project"
  type        = string
}

variable "network_remote_states" {
  description = "Network remote states config"
  type        = map(string)
  default = {
    hostname     = "",
    organization = "",
    workspaces   = "",
  }
}

###################################################
# RDS
###################################################
variable "rds_engine" {
  description = "The database engine to use"
  type        = string
}

variable "rds_engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "rds_port" {
  description = "The port of rds port"
  type        = number
}

variable "rds_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "rds_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "rds_storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  type        = string
}

variable "rds_storage_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1"
  type        = number
  default     = null
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gibibytes."
  type        = number
}

variable "max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage"
  type        = number
  default     = 0
}

variable "rds_availability_zone" {
  description = "The AZ for the RDS instance"
  type        = string
  default     = ""
}

variable "rds_publicly_accessible" {
  description = "Whether the DB should have a public IP address"
  type        = bool
  default     = false
}


variable "rds_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not."
  type        = string
  default     = false
}

variable "rds_performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data."
  type        = string
  default     = ""
}

variable "rds_monitoring_interval" {
  description = "The interval (seconds) between points when Enhanced Monitoring metrics are collected"
  type        = number
  default     = 0
}

variable "rds_backup_retention_period" {
  description = "How long to keep backups for (in days)"
  type        = number
  default     = 7
}

variable "rds_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled"
  type        = string
  default     = "19:00-20:00"
}

variable "rds_apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = false
}

variable "rds_deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default     = false
}

variable "rds_parameter_group_family" {
  description = "The parameter group family"
  type        = string
}

variable "db_parameter_max_connections" {
  description = "The number of simultaneous client connections allowed."
  type        = string
  default     = null
}