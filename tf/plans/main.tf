provider "aws" {
  region = "us-east-1"
  # profile = "default"
}

locals {
  pd_secret_value = jsondecode(data.aws_secretsmanager_secret_version.pd-secret-version.secret_string)["pd-secret"]
}

module "pd-common" {
  source                      = "../common-modules"
  rotation_start              = "2017-06-01T12:00:00-04:00"
  rotation_virtual_start      = "2017-06-01T12:00:00-04:00"
  pd_secret_value             = local.pd_secret_value
}

module "pd-gbst-prod" {
  source                      = "../app-modules/gbst"
  environment                 = "prod"
  pd_gbst_ep_user_email       = "bmquiroz@rc-its.com"
  pd_secret_value             = local.pd_secret_value
  pd_team                     = module.pd-common.pd-team-id

  # depends_on = [
  #   module.pd-common
  # ]
}