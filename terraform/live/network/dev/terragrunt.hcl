terraform {
  source = "../../..//live/network/manifests"
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

  # VPC
  cidr_numeral = "10"
  cidr_numeral_public = ["0", "16", "32"]
  cidr_numeral_private = ["80", "96", "112"]
  cidr_numeral_private_db = ["160", "176", "192"]
  public_availability_zones     = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_availability_zones    = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_db_availability_zones = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}