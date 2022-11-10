locals {
  tfc_hostname = "app.terraform.io"
  tfc_organization = "homeparty"
  tfc_workspaces = "homeparty-dev-network"
  aws_profile = "${get_env("AWS_PROFILE", "homeparty_dev")}"
}