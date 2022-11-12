packer {
  required_version = "~> 1.8"

  required_plugins {
    amazon = {
      version = "~> 1.1.5"
      source  = "github.com/hashicorp/amazon"
    }
  }
}