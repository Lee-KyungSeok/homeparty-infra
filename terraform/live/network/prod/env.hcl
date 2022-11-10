locals {
  tfc_hostname = "app.terraform.io"
  tfc_organization = "homeparty"
  tfc_workspaces = "homeparty-prod-network"
  aws_profile = "${get_env("AWS_PROFILE", "homeparty_prod")}"
}