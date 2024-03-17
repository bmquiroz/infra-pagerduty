terraform {
  required_providers {
    # see https://registry.terraform.io/providers/PagerDuty/pagerduty/2.7.0
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "3.9.0"
    }
  }
}