#terraform {
#  extra_arguments "off-autoinit" {
#    commands = [
#      "apply",
#      "plan",
#      "import",
#      "push",
#      "refresh"
#    ]
#
#    arguments = [
#      "--terragrunt-no-auto-init",
#    ]
#  }
#}