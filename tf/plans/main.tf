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
  rotation_end                = "2017-06-01T12:00:00-04:00"
  # rotation_start              = formatdate("YYYY-MM-DD'T'hh:mm:ssZ", "2024-03-25T12:00:00Z")
  # rotation_end                = timeadd(rotation_start, "336h")
  # rotation_virtual_start      = "2017-06-01T12:00:00-04:00"
  rotation_virtual_start      = formatdate("YYYY-MM-DD'T'hh:mm:ssZ", "2024-03-25T12:00:00Z")
  pd_support_team             = "Tech DevSecOps"
  pd_app_support_team         = "App Support"
  oncall_gbst_devops          = ["bmquiroz@rc-its.com"]
  oncall_gbst_db              = ["bmquiroz@rc-its.com"]
  oncall_gbst_app             = ["bmquiroz@rc-its.com"]
  # oncall_smrs_devops          = ["bmquiroz@rc-its.com"]
  # oncall_smrs_db              = ["bmquiroz@rc-its.com"]
  # oncall_smrs_app             = ["bmquiroz@rc-its.com"]
  # oncall_dmg_devops          = ["bmquiroz@rc-its.com"]
  # oncall_dmg_db              = ["bmquiroz@rc-its.com"]
  # oncall_dmg_app             = ["bmquiroz@rc-its.com"]
  pd_secret_value             = local.pd_secret_value
}

module "pd-gbst-prod" {
  source                      = "../app-modules/gbst"
  environment                 = "prod"
  pd_gbst_ep_app_mgr_email    = "bmquiroz@rc-its.com"
  pd_gbst_ep_app_mgr2_email   = "bmquiroz@rc-its.com"
  pd_secret_value             = local.pd_secret_value
  pd_team                     = module.pd-common.pd-team-id
  pd_schedule                 = module.pd-common.pd-gbst-schedule-id
  pd_db_schedule              = module.pd-common.pd-db-gbst-schedule-id
  pd_app_schedule             = module.pd-common.pd-app-gbst-schedule-id
}

# module "pd-smrs-prod" {
#   source                      = "../app-modules/smrs-ems"
#   environment                 = "prod"
#   pd_smrs_ep_app_mgr_email    = "bmquiroz@rc-its.com"
#   pd_secret_value             = local.pd_secret_value
#   pd_team                     = module.pd-common.pd-team-id
#   pd_schedule                 = module.pd-common.pd-schedule-id
# }

# module "pd-dmg-prod" {
#   source                      = "../app-modules/dmg"
#   environment                 = "prod"
#   pd_dmg_ep_app_mgr_email     = "bmquiroz@rc-its.com"
#   pd_secret_value             = local.pd_secret_value
#   pd_team                     = module.pd-common.pd-team-id
#   pd_schedule                 = module.pd-common.pd-schedule-id
# }