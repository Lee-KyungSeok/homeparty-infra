module "network" {
  source = "../manifests"

  aws_region  = var.aws_region
  aws_profile = var.aws_profile
  environment = "prod"

  # VPC
  cidr_numeral = "10"
  cidr_numeral_public = {
    "0" = "0"
    "1" = "16"
    "2" = "32"
  }
  cidr_numeral_private = {
    "0" = "80"
    "1" = "96"
    "2" = "112"
  }
  cidr_numeral_private_db = {
    "0" = "160"
    "1" = "176"
    "2" = "192"
  }
  public_availability_zones     = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_availability_zones    = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_db_availability_zones = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}
