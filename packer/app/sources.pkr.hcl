data "amazon-ami" "amzn2" {
  filters = {
#    owner-alias = ["amazon"]
    virtualization-type = "hvm"
    name                = "amzn2-ami-hvm*"
    root-device-type    = "ebs"
    architecture        = "x86_64"
  }

  owners = ["amazon"]
  most_recent = true
}

locals {
  created_at = timestamp()
  version = formatdate("YYYYMMDDhhmm", local.created_at)
  ami_name        = join("/", [
    "amzn2",
    "amd64",
    "${var.name}-${local.version}"
  ])
  source_tags = {
    "source-ami.packer.io/id"         = "{{ .SourceAMI }}"
    "source-ami.packer.io/name"       = "{{ .SourceAMIName }}"
    "source-ami.packer.io/owner-id"   = "{{ .SourceAMIOwner }}"
    "source-ami.packer.io/owner-name" = "{{ .SourceAMIOwnerName }}"
    "source-ami.packer.io/created-at" = "{{ .SourceAMICreationDate }}"
  }
  build_tags = {
    "build.packer.io/name"       = var.name
    "build.packer.io/version"    = local.version
    "build.packer.io/os"         = "amzn2"
    "build.packer.io/region"     = "{{ .BuildRegion }}"
    "build.packer.io/created-at" = local.created_at
  }
  tags = {
    "Name" = local.ami_name
  }
}

source "amazon-ebs" "amzn2" {
  ami_name        = local.ami_name
  ami_description = var.description
  source_ami    = data.amazon-ami.amzn2.id

  instance_type = "t2.micro"
  region        = var.aws_region
  ssh_username  = "ec2-user"

  run_tags = merge(
    local.source_tags,
    local.build_tags,
    {
      "Name" = "packer-build/${local.ami_name}",
    }
  )
  tags = merge(
    local.source_tags,
    local.build_tags,
    {
      "Name" = local.ami_name,
    }
  )
}