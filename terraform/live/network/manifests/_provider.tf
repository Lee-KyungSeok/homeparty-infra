provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile == null ? null : var.aws_profile
}
