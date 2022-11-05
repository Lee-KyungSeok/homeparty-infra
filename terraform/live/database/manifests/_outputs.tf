# Project
output "environment" {
  description = "Project environment"
  value       = var.environment
}

###################################################
# RDS
###################################################
output "rds_instance_endpoint" {
  description = "The cluster endpoint"
  value       = aws_db_instance.main.endpoint
}

output "rds_security_group" {
  description = "The security group ID of RDS "
  value       = aws_security_group.rds_security_group.id
}