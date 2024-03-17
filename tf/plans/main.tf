provider "aws" {
  region = "us-east-1"
  # profile = "default"
}

# provider "pagerduty" {
#   token = var.pd-secret-value
# }

module "pd-common" {
  source                      = "../common-modules"
  rotation_start              = "2017-06-01T12:00:00-04:00"
  rotation_virtual_start      = "2017-06-01T12:00:00-04:00"
  pd-secret-value             = output.pd-secret-value

  # depends_on = [
  #   module.base-infra
  # ]
}

module "pd-gbst-prod" {
  source                      = "../app-modules/gbst"
  environment                 = "prod"
  pd_gbst_ep_user_email       = "bmquiroz@rc-its.com"
  pd-secret-value             = output.pd-secret-value

  # depends_on = [
  #   module.pd-common
  # ]
}