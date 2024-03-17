data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_user" "default-user" {
  email = "devops@aenetworks.com"
}