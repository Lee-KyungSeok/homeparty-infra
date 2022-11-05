resource "random_id" "name_suffix" {
  byte_length = 4
  keepers = {
    id = "${local.project}-${var.environment}"
  }
}

data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    hostname     = var.network_remote_states["hostname"]
    organization = var.network_remote_states["organization"]

    workspaces = {
      name = var.network_remote_states["workspaces"]
    }
  }
}

locals {
  project = "homeparty"
  base_tags = {
    Project     = local.project
    Environment = var.environment
  }
}