locals {
  project = "homeparty"
  base_tags = {
    Project     = local.project
    Environment = var.environment
  }
}

resource "random_id" "name_suffix" {
  byte_length = 4
  keepers = {
    id = "${local.project}-${var.environment}"
  }
}