# Project
output "environment" {
  description = "Project environment"
  value       = module.network.environment
}

# VPC
output "vpc_id" {
  description = "VPC ID of newly created VPC"
  value       = module.network.vpc_id
}

output "vpc_owner" {
  description = "VPC Owner id of newly created VPC"
  value       = module.network.vpc_owner
}

output "cidr_block" {
  description = "CIDR block of VPC"
  value       = module.network.cidr_block
}

output "cidr_numeral" {
  description = "number that specifies the vpc range (B class)"
  value       = module.network.cidr_numeral
}

output "public_availability_zones" {
  description = "Public availability zone list of VPC"
  value       = module.network.public_availability_zones
}

output "private_availability_zones" {
  description = "Private biz availability zone list of VPC"
  value       = module.network.private_availability_zones
}

output "private_db_availability_zones" {
  description = "Private developer availability zone list of VPC"
  value       = module.network.private_db_availability_zones
}


output "public_subnets" {
  description = "List of public subnet ID in VPC"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "List of private active directory subnet ID in VPC"
  value       = module.network.private_subnets
}

output "private_db_subnets" {
  description = "List of private developer subnet ID in VPC"
  value       = module.network.private_db_subnets
}

output "public_route_tables" {
  description = "List of public route table ID in VPC"
  value       = module.network.public_route_tables
}

output "private_route_tables" {
  description = "List of private active directory route table ID in VPC"
  value       = module.network.private_route_tables
}

# Prviate route tables
output "private_db_route_tables" {
  description = "List of private route table ID in VPC"
  value       = module.network.private_db_route_tables
}
