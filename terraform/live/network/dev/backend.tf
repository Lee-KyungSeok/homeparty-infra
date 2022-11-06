terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "homeparty"
    workspaces {
      name = "homeparty-dev-network"
    }
  }
}