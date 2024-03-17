terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    # see https://registry.terraform.io/providers/PagerDuty/pagerduty/2.7.0
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "3.9.0"
    }
  }
}