# Project
output "environment" {
  description = "Project environment"
  value       = var.environment
}

# VPC
output "vpc_id" {
  description = "VPC ID of newly created VPC"
  value       = aws_vpc.default.id
}

output "vpc_owner" {
  description = "VPC Owner id of newly created VPC"
  value       = aws_vpc.default.owner_id
}

output "cidr_block" {
  description = "CIDR block of VPC"
  value       = aws_vpc.default.cidr_block
}

output "cidr_numeral" {
  description = "number that specifies the vpc range (B class)"
  value       = var.cidr_numeral
}

output "public_availability_zones" {
  description = "Public availability zone list of VPC"
  value       = var.public_availability_zones
}

output "private_availability_zones" {
  description = "Private availability zone list of VPC"
  value       = var.private_availability_zones
}

output "private_db_availability_zones" {
  description = "Private db availability zone list of VPC"
  value       = var.private_db_availability_zones
}

output "public_subnets" {
  description = "List of public subnet ID in VPC"
  value       = aws_subnet.public.*.id
}

output "private_subnets" {
  description = "List of private active directory subnet ID in VPC"
  value       = aws_subnet.private.*.id
}

output "private_db_subnets" {
  description = "List of private developer subnet ID in VPC"
  value       = aws_subnet.private_db.*.id
}

output "public_route_tables" {
  description = "List of public route table ID in VPC"
  value       = aws_route_table.public.*.id
}

output "private_route_tables" {
  description = "List of private active directory route table ID in VPC"
  value       = aws_route_table.private.*.id
}

output "private_db_route_tables" {
  description = "List of private db route table ID in VPC"
  value       = aws_route_table.private_db.*.id
}

output "public_cidr" {
  description = "List of public cidr in VPC"
  value       = aws_subnet.public.*.cidr_block
}

output "private_cidr" {
  description = "List of private cidr in VPC"
  value       = aws_subnet.private.*.cidr_block
}

output "private_db_cidr" {
  description = "List of private db cidr in VPC"
  value       = aws_subnet.private_db.*.cidr_block
}
