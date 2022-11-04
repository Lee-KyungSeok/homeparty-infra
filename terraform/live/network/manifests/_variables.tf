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

# VPC
variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
  type        = string
}

variable "cidr_numeral_public" {
  description = "The public CIDR numeral (x.x.x.0/20)"
  default     = {}
}

variable "cidr_numeral_private" {
  description = "The private CIDR numeral (x.x.x.0/20)"
  default     = {}
}

variable "cidr_numeral_private_db" {
  description = "The database CIDR numeral (x.x.x.0/20)"
  default     = {}
}

variable "public_availability_zones" {
  description = "A comma-delimited list of availability zones for the Public subnet."
  type        = list(string)
}

variable "private_availability_zones" {
  description = "A comma-delimited list of availability zones for the Private subnet."
  type        = list(string)
}

variable "private_db_availability_zones" {
  description = "A comma-delimited list of availability zones for the Private db subnet."
  type        = list(string)
}