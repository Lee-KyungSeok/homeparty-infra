variable "name" {
  type    = string
  default = "homeparty-app"
}

variable "description" {
  type    = string
  default = "AMI to deploy homeparty app on Amazon Linux2 in AWS EC2."
}

variable "aws_region" {
  description = "The region of infra"
  type        = string
  default     = "ap-northeast-2"
}