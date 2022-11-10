locals {
  env_vars = read_terragrunt_config("env.hcl")
}

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "${local.env_vars.locals.tfc_hostname}"
    organization = "${local.env_vars.locals.tfc_organization}"
    workspaces {
      name = "${local.env_vars.locals.tfc_workspaces}"
    }
  }
}
EOF
}