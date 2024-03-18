terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    # see https://registry.terraform.io/providers/PagerDuty/pagerduty/3.9.0
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "3.9.0"
    }
  }
    backend "s3" {
      bucket = "rcits-pagerduty-config-bucket"
      key    = "pagerduty-tf-state/"
      region = "us-east-1"
  }
}