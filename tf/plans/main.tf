terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # backend "s3" {
  #   bucket = var.backend-bucket
  #   key    = var.backend-key
  #   region = var.backend-region
  # }
}

provider "aws" {
  region = "us-east-1"
  # profile = "default"
}

# provider "pagerduty" {
#   token = local.root_outputs["pagerduty_api_token"]
# }

provider "pagerduty" {
  token = var.pd-secret-value
}

module "pd-common" {
  source                      = "../common-modules"
  rotation_start              = "2017-06-01T12:00:00-04:00"
  rotation_virtual_start      = "2017-06-01T12:00:00-04:00"

  # depends_on = [
  #   module.base-infra
  # ]
}

module "pd-gbst-prod" {
  source                      = "../app-modules/gbst"
  environment                 = "prod"

  depends_on = [
    module.pd-common
  ]
}