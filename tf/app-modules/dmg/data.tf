data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_user" "ep-user" {
  email = var.pd_gbst_ep_user_email
}